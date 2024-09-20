import 'package:chat_app/main.dart';
import 'package:chat_app/view/screen/login_screen/login_screen_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var view = LoginScreenWidget();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    bool obscureText = true;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          margin: EdgeInsets.only(top: height * 0.1),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login an Account',
                    style: TextStyle(color:Colors.blue, fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 35),
                  view.textFiled(hint: 'Email'),
                  SizedBox(height: 16),
                  view.passwordTextField(hint: 'Password', obscureText: obscureText),
                  SizedBox(height: 45),
                  view.loginButton(
                    onPressed: (){

                    },
                    text: 'Login'
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
