import 'package:flutter/material.dart';
import 'package:usarprovide/app_routes.dart';
import 'package:usarprovide/controller/login_controller.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  void initState() {
    super.initState();
    LoginController.verificarToken().then((value) {
      if (value) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
      } else {
        Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            primary: Colors.black,
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () {
            LoginController.verificarToken();
          },
          child: const Text(''),
        ),
        //CircularProgressIndicator(),
      ),
    );
  }
}
