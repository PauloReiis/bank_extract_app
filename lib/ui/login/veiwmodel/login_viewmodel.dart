import 'package:bank_extract_app/data/repository/login_repository.dart';
import 'package:bank_extract_app/data/services/login_service.dart';
import 'package:bank_extract_app/model/dto/login_dto.dart';
import 'package:bank_extract_app/model/entity/login.dart';
import 'package:flutter/material.dart';

/// **Conceito:** Classe para gerenciar as regras de negocio da tela de Login
/// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
class LoginViewModel {
  LoginService _loginService = LoginService();
  LoginRepository _loginRepository = LoginRepository();

  /// **Conceito:** Solicitando acesso a API de Login
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  /// **Retorno:** True = Acesso liberado
  Future<bool> toDoLogin(LoginDTO loginDto) async {
    debugPrint("LoginViewModel => login");
    Login login = Login();
    //Fazendo chamada da API
    LoginDTO result = await _loginService.login(loginDto);

    if (result.tokenAccess != null) {
      debugPrint("Comunicação com API de Login realizada com sucesso");
      login.name = loginDto.userName;
      login.password = loginDto.userPassword;
      login.tokenAccess = result.tokenAccess;
      //Salvando no banco local os dados do acesso
      _loginRepository.salvarDadosLogin(login);
      return true;
    } else {
      throw (result.msg);
    }
    return false;
  }
}
