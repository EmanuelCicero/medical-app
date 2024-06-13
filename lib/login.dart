import 'package:flutter/material.dart';

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
    return const SizedBox(
        width: 250,
        height: 50,
        child: OutlinedButton(
            onPressed: null,
            style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromRGBO(77, 155, 145, 1))),
            child: Text('Login', style: TextStyle(color: Colors.white))));
  }
}
