import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usarprovide/app_routes.dart';

import '../controller/inc_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usando Provider!'),
      ),
      body: Center(
        child: Consumer<IncController>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Quantidade: ${value.number}'),
                const SizedBox(height: 30),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.FORM, arguments: 'teste');
                  },
                  child: const Text('Ir para Formulário'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.LIST, arguments: 'teste');
                  },
                  child: const Text('Ir para Lista'),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () {
          Provider.of<IncController>(context, listen: false).incNumber(2);
        },
      ),
    );
  }
}
