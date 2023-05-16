import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../respository/auth_respoitory.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';


class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRespotory();
  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

    bool _setRegisterLoading = false;
  bool get setregisterLoading => _setRegisterLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  setRegisterLoading(bool value) {
    _setRegisterLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    Utils.FalshBarErrorMessage('Login Successful', context);
    Navigator.pushNamed(context, RoutesName.home);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
        Utils.FalshBarErrorMessage(error.toString(), context);
      }
    });
  }

  Future<void> signUPApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    Utils.FalshBarErrorMessage('SignUp Successful', context);
    Navigator.pushNamed(context, RoutesName.login);
    _myRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if (kDebugMode) {
        print(error.toString());
        Utils.FalshBarErrorMessage(error.toString(), context);
      }
    });
  }

  Future<void> RegisterUserApi(dynamic data, BuildContext context) async {
    setRegisterLoading(true);
    Utils.FalshBarErrorMessage('Register User Successful', context);
    Navigator.pushNamed(context, RoutesName.home);
    _myRepo.RegisterUserApi(data).then((value) {
      setRegisterLoading(false);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setRegisterLoading(false);
      if (kDebugMode) {
        print(error.toString());
        Utils.FalshBarErrorMessage(error.toString(), context);
      }
    });
  }
}
