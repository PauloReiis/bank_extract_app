import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = ControllerBase with _$LoginController;

/// **Conceito:** Em desenolvimento / Em teste
/// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
abstract class ControllerBase with Store {
  @observable
  bool busy = false;

  @action
  void changeState() {
    busy = !busy;
  }
}
