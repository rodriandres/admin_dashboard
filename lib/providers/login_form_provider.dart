import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  // String email = '';

  validateForm() {

    if (formKey.currentState!.validate()) {
      print('Form valid ---- login');
      print('$email ---- $password');
    } else {
      print('Form invalid');
    }

  }

}