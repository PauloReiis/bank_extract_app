import 'package:bank_extract_app/aplication/app_theme.dart';
import 'package:bank_extract_app/model/route/route_app.dart';
import 'package:bank_extract_app/util/constant/constant_route.dart';
import 'package:bank_extract_app/util/constant/constant_string.dart';
import 'package:bank_extract_app/util/util.dart';
import 'package:flutter/material.dart';

void main() async {
  //Inicializando o banco Hive
  await Util.initHive();
  runApp(AppBankExtract());
}

/// **Conceito:** Inicializando o aplicativo
/// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
class AppBankExtract extends StatelessWidget {
  /// **Conceito:** Inicializando tema principal e rotas
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstantString.bankExtract,
      theme: AppTheme(context).defaultTheme(),
      initialRoute: ConstantRoute.splashScreenRota,
      routes: RouteApp.routs,
      debugShowCheckedModeBanner: false,
    );
  }
}
