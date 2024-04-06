
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {

  String? _token;


  login( String email, String password) {
    // HTTP REQUEST
    _token = 'kajsndjkasjdknasjkd1232njajsd.sdjn2';
    print('Storage JWT: $_token');
    LocalStorage.prefs.setString('token', _token!);

    // TODO Navigate to dashboard

    notifyListeners();
  }

  register( String name, String email, String password) {
    // HTTP REQUEST
    print('Register');

    // TODO Navigate to dashboard

    notifyListeners();
  }

}