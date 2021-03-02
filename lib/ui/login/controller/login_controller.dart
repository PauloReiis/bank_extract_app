import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = ControllerBase with _$LoginController;

abstract class ControllerBase with Store {
  @observable
  bool busy = false;

  @action
  void changeState(){
    busy = !busy;
  }
}
