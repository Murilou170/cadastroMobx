import 'package:flutter/material.dart';

import 'cadastro.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobx Flutter',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Cadastro(),
    );
  }
}
