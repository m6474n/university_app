import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_app/home.dart';
import 'package:university_app/screens/admin.dart';
import 'package:university_app/screens/login.dart';
import 'package:university_app/screens/student_screen.dart';
import 'package:university_app/screens/teacher_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  @override
  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? "";

    if (userType == 'Student') {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const StudentPage()));
      });
    } else if (userType == 'Teacher') {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TeacherPage()));
      });
    } else if (userType == 'Admin') {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AdminPage()));
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Image(
        image: AssetImage('assets/imgs/splash.png'),
        height: 200,
        width: 200,
      )),
    );
  }
}
