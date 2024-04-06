import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      // print('Form valid ---- login');
      // print('$name --- $email --- $password');
      return true;
    } else {
      print('Form invalid');
      return false;
    }

  }

}