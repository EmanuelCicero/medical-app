import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/pages/cadastro_page.dart';
import 'package:medical_app/comum/snackbar.dart';
import 'package:medical_app/services/autenticacao.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  final Autenticacao _servicoLogin = Autenticacao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: Form(
          key: _formKey,
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
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle:
                      const TextStyle(color: Color.fromRGBO(93, 102, 118, 1)),
                  filled: true,
                  fillColor: const Color.fromRGBO(228, 241, 238, 1),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Colors.red)),
                ),
                validator: (String? value) {
                  if (value == null) {
                    return "O e-mail não pode ser vazio.";
                  }
                  if (value.length < 5) {
                    return "O e-mail é muito curto.";
                  }
                  if (!value.contains("@")) {
                    return "O e-mail é inválido.";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _senhaController,
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
                validator: (String? value) {
                  if (value == null) {
                    return "A senha não pode ser vazia.";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                  height: 44,
                  width: 350,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(77, 155, 145, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                    onPressed: () {
                      botaoClicado();
                    },
                    child: const Center(
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
      ),
    ));
  }

  botaoClicado() {
    String email = _emailController.text;
    String senha = _senhaController.text;
    if (_formKey.currentState!.validate()) {
      _servicoLogin
          .logarUsuario(email: email, senha: senha)
          .then((String? erro) {
        if (erro != null) {
          mostrarSnackBar(context: context, texto: erro);
        }
      });
    }
  }
}
