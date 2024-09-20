import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegistrationScreenWidget{

  Widget textFiled({required String hint}){
    return  TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget passwordTextField({required String hint, required bool obscureText}){
    return  TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: 'Confirm Password',
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.visibility_off),
          onPressed: () {

          },
        ),
      ),
    );
  }

  Widget loginButton({required void Function()? onPressed, required String text}){
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

}