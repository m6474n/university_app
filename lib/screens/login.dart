import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_app/constants.dart';
import 'package:university_app/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Welcome'),
        backgroundColor: mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Image(
                image: AssetImage('assets/imgs/splash.png'),
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  labelText: 'Email', labelStyle: textstyle),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                  labelText: 'Password', labelStyle: textstyle),
            ),
            const SizedBox(
              height: 80,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('email', emailController.text.toString());
                sp.setString('password', passwordController.text.toString());
                sp.setString('userType', 'Admin');
                // sp.setBool('isLogin', true);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: mainColor,
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
