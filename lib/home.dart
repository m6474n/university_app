import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_app/constants.dart';
import 'package:university_app/screens/login.dart';
import 'package:university_app/screens/student_screen.dart';
import 'package:university_app/screens/teacher_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String email = '', password = '', userType = '';

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    password = sp.getString('password') ?? '';
    userType = sp.getString('userType') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: mainColor,
        title: const Text(
          'Home',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1600',
            ),
            radius: 50,
          ),
          const SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Email:',
                style: textstyle,
              ),
              Text(
                email.toString(),
                style: textstyle,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Password:',
                style: textstyle,
              ),
              Text(
                password.toString(),
                style: textstyle,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'User Type:',
                style: textstyle,
              ),
              Text(
                userType.toString(),
                style: textstyle,
              ),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          InkWell(
            onTap: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.clear();
              if (userType == 'Student') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentPage()));
              } else if (userType == 'Teacher') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TeacherPage()));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              }
            },
            child: Container(
              height: 50,
              width: double.infinity,
              color: buttonColor,
              child: const Center(
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
