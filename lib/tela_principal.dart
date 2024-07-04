import 'package:flutter/material.dart';
import 'package:medical_app/home_page.dart';
import 'package:medical_app/services/autenticacao.dart';

class TelaPrincipalPage extends StatefulWidget {
  const TelaPrincipalPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return TelaPrincipalState();
  }
}

class TelaPrincipalState extends State<TelaPrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          onPressed: () {
            Autenticacao().deslogar();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: const Text("Sair")),
    ));
  }
}
