import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/view/screen/login_screen/login_screen_widget.dart';
import 'package:chat_app/view/screen/registration_screen/registration_screen.dart';
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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                  view.textFiled(hint: 'Email', controller: emailController),
                  SizedBox(height: 16),
                  view.passwordTextField(hint: 'Password', obscureText: obscureText, controller: passwordController),
                  SizedBox(height: 45),
                  view.loginButton(
                    onPressed: (){
                      if(emailController.text.isEmpty){
                        Get.snackbar(
                          'Please enter your name',
                          '',
                          barBlur: 1.0,
                          backgroundColor: Colors.blue,
                          colorText: Colors.white,
                          shouldIconPulse: true,
                          icon: Icon(Icons.error_outline_outlined, color: Colors.red,),
                          overlayBlur: 1.0,
                          animationDuration: Duration(seconds: 1),
                          forwardAnimationCurve: Curves.bounceInOut,
                          reverseAnimationCurve: Curves.easeInOutBack,
                        );
                      }
                      else if(passwordController.text.isEmpty){
                        Get.snackbar(
                          'Please enter your password',
                          '',
                          barBlur: 1.0,
                          backgroundColor: Colors.blue,
                          colorText: Colors.white,
                          shouldIconPulse: true,
                          icon: Icon(Icons.error_outline_outlined, color: Colors.red,),
                          overlayBlur: 1.0,
                          animationDuration: Duration(seconds: 1),
                          forwardAnimationCurve: Curves.bounceInOut,
                          reverseAnimationCurve: Curves.easeInOutBack,
                        );
                      }
                      else{
                        AuthController().login(emailController.text.toString(), passwordController.text.toString());
                      }

                    },
                    text: 'Login'
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          Get.to(
                              RegistrationScreen(),
                              transition: Transition.fade,
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.bounceOut
                          );
                        },
                        child: Text(
                          'Sign up',
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
