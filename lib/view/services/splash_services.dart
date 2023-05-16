import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


import '../../model/user_model.dart';
import '../../utils/routes/routes_name.dart';
import '../../view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserDate() => UserViewModel().getUser();
  
  void CheckAuthentication(BuildContext context) async {
    getUserDate().then((value) async {
      if (value.token == null || value.token == '') {
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
