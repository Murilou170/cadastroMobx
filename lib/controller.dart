import 'package:cadastromobx/models/client.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateName == '' && validateEmail == '';
  }

  String validateName() {
    if (client.name == null || client.name.isEmpty) {
      return 'este campo é obrigatório';
    } else if (client.name.length < 3) {
      return 'seu nome precisa ter mais de 3 caracteres';
    }
    return '';
    //não pode retornar vazio aqui
  }

  String validateEmail() {
    if (client.email == null || client.email.isEmpty) {
      return 'este campo é obrigatório';
    } else if (!client.email.contains("@")) {
      return 'esse não é um email válido';
    }
    return '';
  }
}
