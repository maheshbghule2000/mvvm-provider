import 'package:flutter/material.dart';
import 'package:mvvm_provider/view/services/register_user_services.dart';
import 'package:mvvm_provider/view/signup_view.dart';
import 'package:provider/provider.dart';

import '../res/componants/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class RegisterUserView extends StatefulWidget {
  const RegisterUserView({super.key});

  @override
  State<RegisterUserView> createState() => _RegisterUserViewState();
}

class _RegisterUserViewState extends State<RegisterUserView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  RegisterUserService _registerUserService = RegisterUserService();
  @override
  void initState() {
    // TODO: implement initState
    _registerUserService.CheckAuthentication(context);
    super.initState();
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
              // controller: _emailController,
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
                  // controller: _passwordController,
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
                loading: authViewmode.setregisterLoading,
                tital: 'Sign Up ',
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
                    Map data = {
                      'name': 'morpheus',
                      'job': 'leader'
                      // 'email': _emailController.text.toString(),
                      // 'password': _passwordController.text.toString(),
                    };
                    authViewmode.RegisterUserApi(data, context);
                    // authViewmode.signUPApi(data, context);
                  }
                }),
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
                    onTap: (() {
                      Navigator.pushNamed(context, RoutesName.login);
                    }),
                    child: Text(
                      'Already have an Account',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
