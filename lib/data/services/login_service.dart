import 'dart:convert';

import 'package:bank_extract_app/model/dto/login_dto.dart';
import 'package:bank_extract_app/util/constant/constant_mensagen.dart';
import 'package:bank_extract_app/util/constant/constant_url.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// **Conceito:** Tratando de API
/// **Autor:** Romário Caldeira / **Data:** 09/10/2020
class LoginService {
  /// **Conceito:** Verificando conexão com internet
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  /// **Retorno:** True = Conectado
  static Future<bool> isConnected() async {
    debugPrint('LoginService -> isConnected');
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      debugPrint('Dispositivo conectado a internet');
      return true;
    } else {
      debugPrint('Dispositivo desconectadado da internet');
      return false;
    }
  }

  /// **Conceito:** Tratando dados e enviado para a API
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  /// **Retorno:** Objeto LoginDTO tratado
  Future<dynamic> login(LoginDTO loginDTO) async {
    //Verificando se tem sinal de internet
    if (!await isConnected()) {
      throw ConstantMenssage.connectionError;
    }

    //Convertendo Objeto em Json
    String loginJson = jsonEncode(loginDTO.loginToJson());
    //Montando Url com Https
    String url = Uri.https(ConstantsUrl.host, ConstantsUrl.login).toString();
    //Montando headers
    Map<String, String> headers = {ConstantsUrl.content: ConstantsUrl.typeJson};
    //Definindo tempo de time out com a API
    Duration duration = Duration(seconds: ConstantsUrl.timeoutSeconds);

    //Realizando chamada da API
    http.Response response = await http
        .post(url, headers: headers, body: loginJson)
        .timeout(duration, onTimeout: () => throw (ConstantMenssage.timeout));

    //Tratando a resposta
    if (response != null) {
      if (response.statusCode != 200) {
        if (response.statusCode == 400 || response.statusCode == 403) {
          String body = Utf8Decoder().convert(response.bodyBytes);
          LoginDTO loginDto = LoginDTO.loginErroFromJson(jsonDecode(body));
          return loginDto;
        } else {
          throw ConstantMenssage.communicationError;
        }
      } else {
        String body = Utf8Decoder().convert(response.bodyBytes);
        LoginDTO loginDto = LoginDTO.loginFromJson(jsonDecode(body));
        return loginDto;
      }
    } else {
      throw ConstantMenssage.communicationError;
    }
  }
}
