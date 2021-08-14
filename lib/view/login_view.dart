import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:usarprovide/app_routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formkey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Usuário'),
                  controller: _usuarioController,
                  validator: (usuario) {
                    if (usuario == null || usuario.isEmpty) {
                      return 'Digite o usuário!';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  controller: _senhaController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  validator: (senha) {
                    if (senha == null || senha.isEmpty) {
                      return 'Digite uma senha';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (_formkey.currentState!.validate()) {
                        bool logou = await login(
                            _usuarioController.text, _senhaController.text);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }

                        if (logou) {
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.HOME);
                        } else {
                          _senhaController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(mensagem);
                        }
                      }
                    },
                    child: Text('Entrar'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  final mensagem = SnackBar(
      content: Text('Email ou senha inválidos', textAlign: TextAlign.center),
      backgroundColor: Colors.red[600]);

  Future<bool> login(String login, String senha) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse('http://192.168.0.111/apiflutter/rest.php');
    var resposta = await http.post(url,
        body: json.encode({
          "password": "$senha",
          "login": "$login",
          "class": "ApplicationAuthenticationRestService",
          "method": "getToken"
        }),
        headers: {
          "Authorization":
              "Basic 53da1d5d4f652dbccd2ba5b139448a0d0b9093a8c1827220298d06b013a8"
        });

    var respostaJson = json.decode(resposta.body);

    if (resposta.statusCode != 200 || respostaJson['status'] == 'error') {
      return false;
    } else {
      final token = respostaJson['data'];
      await sharedPreferences.setString('token', token);
      return true;
    }
  }
}
