import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/view/screen/chat_screen/chat_screen.dart';
import 'package:chat_app/view/screen/home_screen/home_screen.dart';
import 'package:chat_app/view/screen/login_screen/login_screen.dart';
import 'package:chat_app/view/screen/loop_bajar/home_screen.dart';
import 'package:chat_app/view/screen/loop_bajar/login_screen.dart';
import 'package:chat_app/view/screen/people_screen/people_screen.dart';
import 'package:chat_app/view/screen/profile_screen/profile_screen.dart';
import 'package:chat_app/view/screen/registration_screen/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen2(),
    );
  }
}

