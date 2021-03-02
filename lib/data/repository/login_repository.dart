import 'package:bank_extract_app/model/entity/login.dart';
import 'package:bank_extract_app/util/constant/constant_db.dart';
import 'package:hive/hive.dart';

class LoginRepository {

  /// **Conceito:** Salvando dados do login
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  Future<void> salvarDadosLogin(Login login) async {
    Box<Login> box = Hive.box(ConstantDb.loginBox);
    await box.add(login);
  }
}
