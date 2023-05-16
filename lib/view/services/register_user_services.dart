import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/model/user_create_model.dart';

import '../../model/user_create_model.dart';
import '../../utils/routes/routes_name.dart';
import '../../view_model/user_view_model.dart';
class RegisterUserService {
  Future<UserCreateModel> getUserDate() =>
      UserViewModel().createUser(UserCreateModel());

  Future<void> CheckAuthentication(BuildContext context) async {
    getUserDate().then((value) async {
      if (value.name == null || value.name == '') {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.signup);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
