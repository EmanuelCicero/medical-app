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
      padding: const EdgeInsets.all(20),
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
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Form(
                  child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Color.fromRGBO(93, 102, 118, 1)),
                  filled: true,
                  fillColor: const Color.fromRGBO(228, 241, 238, 1),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none),
                ),
              )),
            ),
            const SizedBox(
              height: 15,
            ),
            Form(
              child: TextFormField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle:
                      const TextStyle(color: Color.fromRGBO(93, 102, 118, 1)),
                  filled: true,
                  fillColor: Color.fromRGBO(228, 241, 238, 1),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none),
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
                height: 44,
                width: 350,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(77, 155, 145, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const TextButton(
                  onPressed: null,
                  child: Center(
                    child: Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                )),
            const SizedBox(height: 30),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                  style: const TextStyle(
                      fontSize: 16, color: Color.fromRGBO(47, 47, 47, 1)),
                  text: 'Não possui uma conta? ',
                  children: [
                    TextSpan(
                        text: 'Cadastre-se',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CadastroPage()));
                          },
                        style: const TextStyle(
                            color: Color.fromRGBO(
                              14,
                              60,
                              88,
                              1,
                            ),
                            decoration: TextDecoration.underline))
                  ]),
            )
          ],
        ),
      ),
    ));
  }
}
