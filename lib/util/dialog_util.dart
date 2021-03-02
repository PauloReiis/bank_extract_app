import 'package:bank_extract_app/util/constant/constant_string.dart';
import 'package:flutter/material.dart';

/// **Conceito:** Util Montagem Dialog
/// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
class DialogUtil {

  /// **Conceito:** Montar Dialog
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  /// **Obs:** [textButton] Nome Botão, [onButtonPressed] função do botão
  /// [customHeader] Cabeçalho do Dialog, [blocked] se true será modal bloqueado
  static void mountDialog({BuildContext context, String title, String msg,
      String textButton}) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(5),
          elevation: 4,
          title: _baseHeader(context, title),
          content: Text(
            msg,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(textButton ?? ConstantString.ok)),
          ],
        );
      },
    );
  }

  /// **Conceito:** Montar Cabeçalho Dialog
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  static Widget _baseHeader(BuildContext context, String title) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Theme.of(context).backgroundColor),
        ),
      ),
    );
  }
}
