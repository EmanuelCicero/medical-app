import 'package:flutter/material.dart';
import 'package:medical_app/login_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: (const EdgeInsets.only(top: 10, left: 25, right: 25)),
        height: 50,
        width: 200,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(77, 175, 145, 1),
            borderRadius: BorderRadius.all(Radius.circular(32))),
        child: TextButton(
          child: const Center(
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
        ));
  }
}
