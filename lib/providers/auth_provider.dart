import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/https/auth_response.dart';
import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {

  AuthStatus authStatus = AuthStatus.checking; 
  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }

  login( String email, String password) {
    final data = {
      'correo': email,
      'password': password,
    };

    CafeApi.post('/auth/login', data).then(
      (res) {
        final authResponse = AuthResponse.fromMap(res);
        user = authResponse.usuario;

        authStatus = AuthStatus.authenticated;
        LocalStorage.prefs.setString('token', authResponse.token);
        NavigationService.replaceTo(Flurorouter.dashboardRoute);

        CafeApi.configureDio();

        notifyListeners();
      }
    ).catchError( (e) {
      NotificationsService.showSnackbarError('Invalid User or Password');
    });
  }

  register( String name, String email, String password) {

    final data = {
      'nombre': name,
      'correo': email,
      'password': password,
    };

    CafeApi.post('/usuarios', data).then(
      (res) {
        final authResponse = AuthResponse.fromMap(res);
        user = authResponse.usuario;

        authStatus = AuthStatus.authenticated;
        LocalStorage.prefs.setString('token', authResponse.token);
        NavigationService.replaceTo(Flurorouter.dashboardRoute);

        CafeApi.configureDio();

        notifyListeners();
      }
    ).catchError( (e) {
      NotificationsService.showSnackbarError('Invalid User or Password');
    });
  }

  Future<bool> isAuthenticated() async {

    final token = LocalStorage.prefs.getString('token');

    if( token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final response = await CafeApi.httpGet('/auth');
        final authResponse = AuthResponse.fromMap(response);
        LocalStorage.prefs.setString('token', authResponse.token);
        
        user = authResponse.usuario;

        authStatus = AuthStatus.authenticated;
        notifyListeners();
        return true;
    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    // NavigationService.replaceTo(Flurorouter.loginRoute);
    notifyListeners();
  }

}