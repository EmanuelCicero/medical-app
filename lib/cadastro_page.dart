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
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Cadastre-se',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  child: TextFormField(
                decoration: const InputDecoration(labelText: 'Nome completo:'),
              )),
              const SizedBox(
                height: 10,
              ),
              Form(
                  child: TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail:'),
              )),
              const SizedBox(
                height: 10,
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
                height: 70,
              ),
              Container(
                  margin: (const EdgeInsets.only(top: 10, left: 25, right: 25)),
                  height: 50,
                  width: 200,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(77, 175, 145, 1),
                      borderRadius: BorderRadius.all(Radius.circular(32))),
                  child: TextButton(
                    child: const Center(
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(color: Colors.white),
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
                        fontSize: 14, color: Color.fromRGBO(47, 47, 47, 1)),
                    text: 'Já possui uma conta?',
                    children: [
                      TextSpan(
                          text: ' Entrar',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                          style: const TextStyle(
                            color: Color.fromRGBO(14, 60, 88, 1),
                          ))
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
