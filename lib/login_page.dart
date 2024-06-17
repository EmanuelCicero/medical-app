import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Login',
            style:
                TextStyle(color: Color.fromRGBO(47, 47, 47, 1), fontSize: 22),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const TextField(
                  decoration: InputDecoration(labelText: 'E-mail:'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    labelText: 'Senha:',
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    margin:
                        (const EdgeInsets.only(top: 10, left: 25, right: 25)),
                    height: 50,
                    width: 200,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(77, 175, 145, 1),
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                    child: const TextButton(
                      onPressed: null,
                      child: Center(
                        child: Text(
                          'Entrar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
                const SizedBox(height: 30),
                const Text(
                  'Ainda não tem conta? Cadastre-se',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ));
  }
}
