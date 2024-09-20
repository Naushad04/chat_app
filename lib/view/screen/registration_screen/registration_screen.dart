import 'package:chat_app/view/screen/login_screen/login_screen.dart';
import 'package:chat_app/view/screen/registration_screen/registration_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    var view = RegistrationScreenWidget();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    bool obscureText = true;

    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: width * 0.25,
                      height: height * 0.25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(Icons.person, size: 70, color: Colors.white,),
                    ),
                    Positioned(
                      bottom: height * 0.036,
                        child: Container(
                          width: width * 0.090,
                          height: height * 0.090,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300
                          ),
                          child: Icon(Icons.camera_alt, size: 15,),
                        ),
                    )
                  ]
                ),
                view.textFiled(hint: 'Name'),
                SizedBox(height: 16),
                view.textFiled(hint: 'Email'),
                SizedBox(height: 16),
                view.textFiled(hint: 'Age'),
                SizedBox(height: 16),
                view.textFiled(hint: 'Bio'),
                SizedBox(height: 16),
                view.textFiled(hint: 'Address'),
                SizedBox(height: 16),
                view.textFiled(hint: 'Marital status'),
                SizedBox(height: 16),
                view.passwordTextField(hint: 'Password', obscureText: obscureText),
                SizedBox(height: 25),
               view.loginButton(
                 onPressed: (){
                   Get.to(LoginScreen(), transition: Transition.fade, duration: const Duration(milliseconds: 800), curve: Curves.bounceOut);
                 },
                 text: 'Registration'
               ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                      onPressed: () {

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
    );
  }
}
