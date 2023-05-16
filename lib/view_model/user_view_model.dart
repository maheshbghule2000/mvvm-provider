import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mvvm_provider/model/user_create_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> SaveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    return UserModel(token: token.toString());
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }

  Future<UserCreateModel> createUser(UserCreateModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('name', user.name.toString());
    // sp.setString('job', user.job.toString());
    // sp.setString('id', user.id.toString());
    // sp.setString('createdAt', user.createdAt.toString());
    notifyListeners();
    return UserCreateModel();
  }
}
