import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {

        final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);

        return Container(
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: registerFormProvider.formKey,
                child: Column(
                  children: [
        
                    TextFormField(
                      onChanged: ( value ) => registerFormProvider.name = value,
                      validator:(value) {
                        if (value == null || value.isEmpty ) return 'Name is required';
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Gap with your name',
                        label: 'Name',
                        icon: Icons.person
                      ),
                    ),
        
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: ( value ) => registerFormProvider.email = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Email is required';
                        if (!EmailValidator.validate(value)) return 'Incorrect email format';
                        return null; // Valido
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Write Email',
                        label: 'Email',
                        icon: Icons.email_outlined
                      ),
                    ),
        
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: ( value ) => registerFormProvider.password = value,
                      validator:(value) {
                        if (value == null || value.isEmpty) return 'Passwod is required';
                        if (value.length < 6) return 'Password must have more than 6 characters';
                        return null; // Valido
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: '***********',
                        label: 'Password',
                        icon: Icons.lock_outline_rounded
                      ),
                    ),
        
                    const SizedBox(height: 20),
                    CustomOutlinedButton(
                      onPressed: () {
                        
                        final isValid = registerFormProvider.validateForm();
                        if (!isValid) return;

                        final authProvider = Provider.of<AuthProvider>(context, listen: false);
                        authProvider.register(
                          registerFormProvider.name,
                          registerFormProvider.email,
                          registerFormProvider.password
                        );

                      },
                      text: 'Register',
                    ),
        
                    const SizedBox(height: 20),
        
                    LinkText(
                      text: 'I have my account',
                      onPressed: (){
                        Navigator.pushNamed(context, Flurorouter.loginRoute);
                      },
                    ),
        
                  ],
                )
              ),
            ),
          ),
        );
      }, )
    );
  }
}