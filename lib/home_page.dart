import 'package:flutter/material.dart';
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
      appBar: AppBar(
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
          const Text(
            'Sua jornada para o bem estar começa aqui!',
            style:
                TextStyle(fontSize: 15, color: Color.fromRGBO(47, 47, 47, 1)),
          ),
          Image.asset(
            'assets/images/vitalis_illustration.png',
            width: 320,
            height: 275,
          ),
          const Login(),
          const Text('Não possui uma conta? Cadastre-se'),
        ],
      )),
    );
  }
}
