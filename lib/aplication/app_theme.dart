import 'package:bank_extract_app/util/constant/constant_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// **Conceito:** Definindo temas do App
/// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
class AppTheme {
  AppTheme(this.context);

  final BuildContext context;

  /// **Conceito:** Definindo tema geral do App
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  ThemeData defaultTheme() {
    return ThemeData(
        //cor dos itens principais do aplicativo
        primaryColor: ConstantStyle.primaryColor,

        //visualDensity: VisualDensity.adaptivePlatformDensity,

        //cor de mensagem de erro padrão
        errorColor: ConstantStyle.primaryErroColor,

        //monta tema do AppBar
        appBarTheme: _appBarThemeData(),

        //cor das fontes
        backgroundColor: ConstantStyle.primaryColor,

        //cor do plano de funco do aplicativo
        scaffoldBackgroundColor: ConstantStyle.primaryBackgroundColor);
  }

  /// **Conceito:** Definindo tema do AppBar
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  AppBarTheme _appBarThemeData() {
    return AppBarTheme(
      textTheme: TextTheme(
        headline6: GoogleFonts.lato(fontSize: 20.0),
      ),
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}