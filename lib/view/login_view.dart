import 'package:flutter/material.dart';
import 'package:usarprovide/app_routes.dart';
import 'package:usarprovide/controller/login_controller.dart';

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
                        Map<String, dynamic> logou =
                            await LoginController.fazerLogin(
                                _usuarioController.text, _senhaController.text);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }

                        if (logou['status'] == 'success') {
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.HOME);
                        } else {
                          _senhaController.clear();

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(logou['data'],
                                  textAlign: TextAlign.center),
                              backgroundColor: Colors.red[600]));
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
}
