
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {

  String? _token;


  login( String email, String password) {
    // HTTP REQUEST
    _token = 'kajsndjkasjdknasjkd1232njajsd.sdjn2';
    print('Storage JWT: $_token');

    // TODO Navigate to dashboard

    notifyListeners();
  }

    register( String name, String email, String password) {
    // HTTP REQUEST
    _token = 'kajsndjkasjdknasjkd1232njajsd.sdjn2';
    print('Storage JWT: $_token');

    // TODO Navigate to dashboard

    notifyListeners();
  }

}