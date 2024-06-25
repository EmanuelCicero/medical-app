import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/cadastro_page.dart';

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
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Login',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 60,
            ),
            Form(
                child: TextFormField(
              decoration: const InputDecoration(labelText: 'E-mail:'),
            )),
            const SizedBox(
              height: 15,
            ),
            Form(
              child: TextFormField(
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
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
                margin: (const EdgeInsets.only(top: 10, left: 25, right: 25)),
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
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                  style: const TextStyle(
                      fontSize: 14, color: Color.fromRGBO(47, 47, 47, 1)),
                  text: 'Não possui uma conta?',
                  children: [
                    TextSpan(
                        text: ' Cadastre-se',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CadastroPage()));
                          },
                        style: const TextStyle(
                          color: Color.fromRGBO(14, 60, 88, 1),
                        ))
                  ]),
            )
          ],
        ),
      ),
    ));
  }
}
