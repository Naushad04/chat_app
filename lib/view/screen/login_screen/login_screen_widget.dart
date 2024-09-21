import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreenWidget{


  Widget textFiled({required String hint, required TextEditingController controller}){
    return  TextFormField(
      controller: controller,
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

  Widget passwordTextField({required String hint, required bool obscureText, required TextEditingController controller}){
    return  StatefulBuilder(
      builder: (context, setState) {
        return  TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon((obscureText ? Icons.visibility_off : Icons.visibility)),
              onPressed: () {
                setState((){
                  obscureText = !obscureText;
                });
              },
            ),
          ),
        );
      },

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