import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usarprovide/controller/inc_controller.dart';
import 'package:usarprovide/view/home_view.dart';

import 'app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => IncController(),
        child: HomeView(),
      ),
      routes: AppRoutes.rotas,
    );
  }
}
