import 'package:flutter/material.dart';

/// **Conceito:** Util de Widgets
/// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
class WidgetUtil{
  /// **Conceito:** Obter largura da tela por porcetagem
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  static double widthPercentage(BuildContext context, double percentage) {
    return (MediaQuery.of(context).size.width / 100) * percentage;
  }

  /// **Conceito:** Obter altura da tela por porcetagem
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  static double heightPercentage(BuildContext context, double percentage) {
    return (MediaQuery.of(context).size.height / 100) * percentage;
  }
}