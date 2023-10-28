import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/screens/authentication_screen.dart';
import 'package:first_app/screens/home/home_view.dart';
import 'package:first_app/screens/login.dart';
import 'package:first_app/screens/login/login_view.dart';
import 'package:first_app/screens/signup.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication App',
      theme: ThemeData(
        fontFamily: "NunitoSans",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: true,
      ),
      home: LoginView()
    );
  }
}

