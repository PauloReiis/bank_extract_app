import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

/// **Conceito:** Em desenolvimento / Em teste
/// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
abstract class LoginStoreBase with Store {
  @observable
  bool busy = false;

  @action
  void changeState() {
    busy = !busy;
  }
}
