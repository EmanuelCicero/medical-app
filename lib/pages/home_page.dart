import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_app/pages/cadastro_page.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Vitalis',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(77, 155, 145, 1))),
            Image.asset(
              'assets/images/logo.png',
              width: 63,
              height: 50,
            ),
          ],
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Bem-vindo!',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(47, 47, 47, 1))),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'Sua jornada para o bem estar começa aqui!',
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 20, color: Color.fromRGBO(47, 47, 47, 1)),
            ),
          ),
          Image.asset(
            'assets/images/vitalis_illustration.png',
            width: 320,
            height: 275,
          ),
          const Login(),
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
                                  builder: (context) => const CadastroPage()));
                        },
                      style: const TextStyle(
                          color: Color.fromRGBO(14, 60, 88, 1),
                          decoration: TextDecoration.underline))
                ]),
          ),
        ],
      )),
    );
  }
}
