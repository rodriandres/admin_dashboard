import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/router/router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370),
          child: Form(
            child: Column(
              children: [

                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Gap with your name',
                    label: 'Name',
                    icon: Icons.supervised_user_circle_rounded
                  ),
                ),

                const SizedBox(height: 20),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Write Email',
                    label: 'Email',
                    icon: Icons.email_outlined
                  ),
                ),

                const SizedBox(height: 20),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: '***********',
                    label: 'Password',
                    icon: Icons.lock_outline_rounded
                  ),
                ),

                const SizedBox(height: 20),
                CustomOutlinedButton(
                  onPressed: () => print('Register'),
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
  }
}