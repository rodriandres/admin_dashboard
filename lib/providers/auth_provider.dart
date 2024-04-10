
import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/https/auth_response.dart';
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
  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }

  login( String email, String password) {
    // HTTP REQUEST
    _token = 'kajsndjkasjdknasjkd1232njajsd.sdjn2';
    LocalStorage.prefs.setString('token', _token!);

    authStatus = AuthStatus.authenticated;
    notifyListeners();

    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  register( String name, String email, String password) {

    final data = {
      'nombre': name,
      'correo': email,
      'password': password,
    };

    CafeApi.post('/usuarios', data).then(
      (json) {
        final authResponse = AuthResponse.fromMap(json);
        user = authResponse.usuario;

        authStatus = AuthStatus.authenticated;
        LocalStorage.prefs.setString('token', authResponse.token);
        NavigationService.replaceTo(Flurorouter.dashboardRoute);
        notifyListeners();
      }
    ).catchError( (e) => print('Error: $e'));

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