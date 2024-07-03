import 'package:flutter/material.dart';
import 'cadastro_page.dart';

class CadastroPerfil extends StatefulWidget {
  const CadastroPerfil({super.key});

  @override
  PreencherPerfil createState() => PreencherPerfil();
}

class PreencherPerfil extends State<CadastroPerfil> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => const CadastroPage()));
                },
              ),
              const SizedBox(
                width: 0,
              ),
              const Text("Preencha seu perfil")
            ],
          )),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
        margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const SizedBox(
                child: CircleAvatar(
                  radius: 90,
                  backgroundColor: Color.fromRGBO(77, 155, 145, 1),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 85,
                    backgroundImage: AssetImage('assets/images/user-icon.webp'),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 187, 187, 187),
                        radius: 20,
                        child: Icon(
                          Icons.camera_alt,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Nome',
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(93, 102, 118, 1)),
                      filled: true,
                      fillColor: const Color.fromRGBO(228, 241, 238, 1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira seu nome';
                    }
                    return null;
                  },
                  onSaved: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(93, 102, 118, 1)),
                      filled: true,
                      fillColor: const Color.fromRGBO(228, 241, 238, 1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none)),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira seu email';
                    }
                    return null;
                  },
                  onSaved: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                      labelText: 'Data de Nascimento',
                      labelStyle: const TextStyle(
                          color: Color.fromRGBO(93, 102, 118, 1)),
                      suffixIcon: const Icon(Icons.calendar_today),
                      filled: true,
                      fillColor: const Color.fromRGBO(228, 241, 238, 1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none)),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _dateController.text =
                            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                      });
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, selecione sua data de nascimento';
                    }
                    return null;
                  },
                ),
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    labelText: 'Gênero',
                    labelStyle:
                        const TextStyle(color: Color.fromRGBO(93, 102, 118, 1)),
                    filled: true,
                    fillColor: const Color.fromRGBO(228, 241, 238, 1),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none)),
                items: const [
                  DropdownMenuItem(
                      value: 'Masculino', child: Text('Masculino')),
                  DropdownMenuItem(value: 'Feminino', child: Text('Feminino')),
                  DropdownMenuItem(value: 'Outro', child: Text('Outro')),
                ],
                onChanged: (value) {
                  setState(() {});
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecione seu gênero';
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
              Container(
                margin: (const EdgeInsets.only(
                  top: 50,
                )),
                height: 44,
                width: 320,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(77, 155, 145, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                  child: const Center(
                    child: Text(
                      'Salvar',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
