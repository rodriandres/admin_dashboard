
import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/https/categories_response.dart';
import 'package:admin_dashboard/services/notifications_service.dart';

class CategoriesProvider extends ChangeNotifier {

  List<Category> categories = [];

  getCategories() async {

    CafeApi.httpGet('/categorias').then(
      (res) {
        final categoriesResponse = CategoriesResponse.fromMap(res);
        categories = categoriesResponse.categorias;

        notifyListeners();
      }
    ).catchError( (e) {
      NotificationsService.showSnackbarError('Error at get Categories');
    });
  }

  Future createCategory(String name) async {

    final data = {
      'nombre': name,
    };
 
    try {

      final response = await CafeApi.post('/categorias', data);
      final newCategory = Category.fromMap(response);

      categories.add(newCategory);

      NotificationsService.showSnackbarSuccess('Create category successfully ');

      notifyListeners();

    } catch (e) {
      NotificationsService.showSnackbarError('Error at create Category');
    }
  }

  Future updateCategory(String name, String id) async {

    final data = {
      'nombre': name,
    };
 
    try {

      await CafeApi.put('/categorias/$id', data);
  
      categories = categories.map(
        (category) {
          if (category.id != id) return category;
          category.nombre = name;
          return category;
        }
      ).toList();
 
      NotificationsService.showSnackbarSuccess('Update category successfully ');

      notifyListeners();

    } catch (e) {
      NotificationsService.showSnackbarError('Error at update Category');
    }
  }

  Future deleteCategory(String id) async {
 
    try {

      await CafeApi.delete('/categorias/$id');
  
      categories.removeWhere((category) => category.id == id);
 
      NotificationsService.showSnackbarSuccess('Delete category successfully ');

      notifyListeners();

    } catch (e) {
      NotificationsService.showSnackbarError('Error at delete Category');
    }
  }

}