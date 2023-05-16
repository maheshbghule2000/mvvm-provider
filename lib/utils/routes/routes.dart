import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/routes/routes_name.dart';

import '../../view/home_screen.dart';
import '../../view/login_view.dart';
import '../../view/signup_view.dart';
import '../../view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashview:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashView());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginView());
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignupView());

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
    }
  }
}
