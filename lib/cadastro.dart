import 'package:cadastromobx/controller.dart';
import 'package:cadastromobx/models/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final client = Client();
  final controller = Controller();

  _textField({String? labelText, onChanged, String Function()?, errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Observer(
              builder: (context) {
                return _textField(
                  errorText: controller.validateName,
                  labelText: 'name',
                  onChanged: controller.client.changeName,
                );
              },
            ),
            SizedBox(height: 20),
            Observer(
              builder: (context) {
                return _textField(
                  errorText: controller.validateEmail,
                  labelText: 'email',
                  onChanged: controller.client.changeEmail,
                );
              },
            ),
            SizedBox(height: 50),
            Observer(
              builder: (_) {
                return ElevatedButton(
                    onPressed: controller.isValid ? () {} : null,
                    child: Text('Salvar'));
              },
            )
          ],
        ),
      ),
    );
  }
}
