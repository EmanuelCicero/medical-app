import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/comum/snackbar.dart';
import 'package:medical_app/login_page.dart';
import 'package:medical_app/services/autenticacao.dart';
import 'finalização_cadastro.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return CadastroState();
  }
}

class CadastroState extends State<CadastroPage> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  final Autenticacao _servicoCadastro = Autenticacao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        child: Center(
          child: Form(
            key: _formKey,
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
                TextFormField(
                  controller: _nomeController,
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
                  validator: (String? value) {
                    if (value == null) {
                      return "O nome não pode ser vazio.";
                    }
                    if (value.length < 5) {
                      return "O nome é muito curto.";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
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
                  height: 10,
                ),
                TextFormField(
                  controller: _senhaController,
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
                  validator: (String? value) {
                    if (value == null) {
                      return "O campo senha não pode ser vazio.";
                    }
                    if (value.length < 5) {
                      return "A senha é muito curta.";
                    }
                    return null;
                  },
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
                                builder: (context) => const CadastroPerfil()));
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
                                        builder: (context) =>
                                            const LoginPage()));
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
      ),
    );
  }

  botaoClicado() {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;
    if (_formKey.currentState!.validate()) {
      _servicoCadastro
          .cadastrarUsuario(nome: nome, email: email, senha: senha)
          .then(
        (String? erro) {
          if (erro != null) {
            mostrarSnackBar(context: context, texto: erro);
          }
        },
      );
    }
  }
}
