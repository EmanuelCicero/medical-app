import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/login_page.dart';
import 'package:medical_app/tela_principal.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return CadastroState();
  }
}

class CadastroState extends State<CadastroPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Cadastre-se',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome completo',
                  labelStyle:
                      const TextStyle(color: Color.fromRGBO(93, 102, 118, 1)),
                  filled: true,
                  fillColor: const Color.fromRGBO(228, 241, 238, 1),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none),
                ),
              )),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Form(
                    child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle:
                        const TextStyle(color: Color.fromRGBO(93, 102, 118, 1)),
                    filled: true,
                    fillColor: const Color.fromRGBO(228, 241, 238, 1),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none),
                  ),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                child: TextFormField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle:
                        const TextStyle(color: Color.fromRGBO(93, 102, 118, 1)),
                    filled: true,
                    fillColor: const Color.fromRGBO(228, 241, 238, 1),
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
                  child: TextButton(
                    child: const Center(
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TelaPrincipalPage()));
                    },
                  )),
              const SizedBox(
                height: 30,
              ),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromRGBO(47, 47, 47, 1)),
                    text: 'Já possui uma conta? ',
                    children: [
                      TextSpan(
                          text: 'Entrar',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                          style: const TextStyle(
                              color: Color.fromRGBO(14, 60, 88, 1),
                              decoration: TextDecoration.underline))
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
