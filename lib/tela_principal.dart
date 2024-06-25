import 'package:flutter/material.dart';

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
    return const Scaffold(
        body: Center(
      child: Text('Tela Principal'),
    ));
  }
}
