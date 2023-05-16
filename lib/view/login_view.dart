import 'dart:convert';
import 'dart:html';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'dart:html';

import 'package:provider/provider.dart';

import '../res/componants/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailfocusNode = FocusNode();
  FocusNode passwordfocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailfocusNode.dispose();
    passwordfocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewmode = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Image.asset(
              'baapb.png',
              height: 130,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
              onChanged: ((value) {
                // log(value);
              }),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailfocusNode, passwordfocusNode);
              },
            ),
            SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: toggle.value,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      suffix: InkWell(
                          onTap: () {
                            toggle.value = !toggle.value;
                          },
                          child: Icon(toggle.value
                              ? Icons.visibility_off
                              : Icons.visibility))),
                  onChanged: ((value) {
                    // log(value);
                  }),
                );
              },
            ),
            SizedBox(
              height: 100,
            ),
            RoundButton(
                loading: authViewmode.loading,
                tital: 'Login btn',
                onpress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.FalshBarErrorMessage(
                        'Please Enter valid Email', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.FalshBarErrorMessage(
                        'Please Enter Password', context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.FalshBarErrorMessage(
                        'Please Enter 6 Digit Password', context);
                  } else {
                    // Map data = {
                    //   'email': _emailController.text.toString(),
                    //   'password': _passwordController.text.toString(),
                    // };
                    Map data = {
                      'email': 'eve.holt@reqres.in',
                      'password': 'cityslicka',
                    };
                    authViewmode.loginApi(data, context);
                  }
                }),
            // InkWell(
            //     onTap: () {},
            //     child: Container(
            //         height: 50,
            //         decoration: BoxDecoration(
            //             color: Colors.black,
            //             borderRadius: BorderRadius.circular(20)),
            //         child: Center(
            //           child: Text(
            //             "Login",
            //             style: TextStyle(color: Colors.white),
            //           ),
            //         ))),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.read_more),
                InkWell(
                  onTap: (() {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => SignUpPage()));
                  }),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.signup);
                    },
                    child: Text(
                      'Create your account',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
                onTap: () {
                  // Utils.toastMessage('No internet conncetion');
                  // Utils.FalshBarErrorMessage('No internet Connection', context);
                  // Utils.snackBar('No  Connection', context);
                  // Navigator.pushNamed(context, RoutesName.homescreen);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Center(child: Text('data')))
          ],
        ),
      ),
    );
  }
}
