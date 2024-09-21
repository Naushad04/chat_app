import 'package:chat_app/controller/image_picker_controller.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/view/screen/loop_bajar/home_screen.dart';
import 'package:chat_app/view/screen/profile_screen/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../view/screen/home_screen/home_screen.dart';
import '../view/screen/login_screen/login_screen.dart';

class AuthController{
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future registration(UserModel user) async{
    try{
      await _auth.createUserWithEmailAndPassword(
          email: user.email.toString(),
          password: user.password.toString()
      ).then((onValue){
        Get.snackbar(
          'Success registration',
          '${user.email}',
          icon: Icon(Icons.check_circle, color: Colors.white),
          barBlur: 1.0,
          backgroundColor: Colors.blue,
          colorText: Colors.white,
          shouldIconPulse: true,
          overlayBlur: 1.0,
          animationDuration: Duration(seconds: 1),
          forwardAnimationCurve: Curves.bounceInOut,
          reverseAnimationCurve: Curves.easeInOutBack,
        );
        var uid = _auth.currentUser!.uid;
        user.userId = uid;
        userStoreData(uid, user);
        Get.to(
            const LoginScreen(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 800),
            curve: Curves.bounceOut,
        );
      });
    }
    catch(e){
      Get.snackbar(
        'Fail',
        '${e}',
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
  }

  Future<void> userStoreData(String uid, UserModel user) async {
    try {
      final imagePickerController = Get.find<ImagePickerController>();
      var imagePath = imagePickerController.userImagePath;
      var imageName = imagePickerController.userImageName;

      if (imagePath != null && imageName != null) {
        var imageType = imageName.split('.').last;

        final putImage = _storage.ref('user_image').child(imageName);
        await putImage.putFile(imagePath, SettableMetadata(contentType: 'image/$imageType'));

        var imageDownloadUrl = await putImage.getDownloadURL();
        user.image = imageDownloadUrl.toString();

        await _fireStore.collection('users').doc(uid).set(user.toJson()).then((onValue) {

        });
      } else {
        Get.snackbar(
          'Image Upload',
          'No profile image provided',
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

    } catch (e) {
      Get.snackbar(
        'Fail',
        'Data storage failed: $e',
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
      print('Storage error: $e');
    }
  }

  Future login(String email, String password)async {
    try {
      var userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.toString(),
        password: password.toString(),
      ).then((onValue){
        Get.snackbar(
          "User signed in",
          email,
          icon: Icon(Icons.check_circle, color: Colors.white),
          barBlur: 1.0,
          backgroundColor: Colors.blue,
          colorText: Colors.white,
          shouldIconPulse: true,
          overlayBlur: 1.0,
          animationDuration: Duration(seconds: 1),
          forwardAnimationCurve: Curves.bounceInOut,
          reverseAnimationCurve: Curves.easeInOutBack,
        );
        Get.to(
            HomeScreen2(),
            transition: Transition.circularReveal,
            duration: const Duration(milliseconds: 800),
            curve: Curves.bounceOut
        );
      });

    } on FirebaseAuthException catch (e) {
        Get.snackbar(
          'Fail',
          'No user found for that email & password',
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
  }

  Stream<List<UserModel>> getUsers() {
    return _fireStore.collection('users').where('userId', isEqualTo: _auth.currentUser?.uid.toString()).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList());
  }

  Stream<List<UserModel>> getAllUsers() {
    return _fireStore.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList());
  }

}