import 'package:bank_extract_app/aplication/splash_screen.dart';
import 'package:bank_extract_app/ui/home/view/home_view.dart';
import 'package:bank_extract_app/ui/login/view/login_view.dart';
import 'package:bank_extract_app/util/constant/constant_route.dart';
import 'package:flutter/material.dart';

/// **Conceito:** Iniciando rotas do App
/// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
class RouteApp {
  static final routs = <String, WidgetBuilder>{
    ConstantRoute.splashScreenRota: (BuildContext context) => SplashScreen(),
    ConstantRoute.loginRota: (BuildContext context) => LoginView(),
    ConstantRoute.homeRota: (BuildContext context) => HomeView(),
  };
}
