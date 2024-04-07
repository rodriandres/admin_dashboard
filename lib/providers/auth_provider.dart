
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {

  String? _token;
  AuthStatus authStatus = AuthStatus.checking; 

  AuthProvider() {
    isAuthenticated();
  }

  login( String email, String password) {
    // HTTP REQUEST
    _token = 'kajsndjkasjdknasjkd1232njajsd.sdjn2';
    print('Storage JWT: $_token');
    LocalStorage.prefs.setString('token', _token!);

    // TODO Navigate to dashboard
    authStatus = AuthStatus.authenticated;
    notifyListeners();

    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  register( String name, String email, String password) {
    // HTTP REQUEST
    print('Register');

    // TODO Navigate to dashboard

    notifyListeners();
  }

  Future<bool> isAuthenticated() async {

    final token = LocalStorage.prefs.getString('token');

    if( token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // authStatus = AuthStatus.checking;
    // notifyListeners();

    // TODO Check if JWT is valid in BE

    await Future.delayed(Duration(milliseconds: 1000));

    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }

}