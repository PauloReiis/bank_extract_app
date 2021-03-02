import 'dart:async';

import 'package:bank_extract_app/util/constant/constant_route.dart';
import 'package:bank_extract_app/util/constant/constant_style.dart';
import 'package:bank_extract_app/util/widget_util.dart';
import 'package:flutter/material.dart';

/// **Conceito:** Definindo tela de abertura do App
/// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacityLevel = 0.0;

  /// **Conceito:** Inicializando a classe
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  @override
  void initState() {
    super.initState();
    _changeOpacity();
  }

  /// **Conceito:** iniciando montagem da tela
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ConstantStyle.primaryBackgroundColor,
      child: SizedBox(
        child: Stack(
          children: [
            animatedOpacity(),
          ],
        ),
      ),
    );
  }

  /// **Conceito:** Mudando a opacidade da tela
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  void _changeOpacity() {
    setState(() {
      _opacityLevel = _opacityLevel == 0 ? 1.0 : 0.0;
    });
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context)
            .pushReplacementNamed(ConstantRoute.loginRota));
  }

  /// **Conceito:** Animação da tela Splash Screen
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  AnimatedOpacity animatedOpacity() {
    return AnimatedOpacity(
        duration: Duration(seconds: 3),
        opacity: _opacityLevel,
        child: Container(
          alignment: Alignment.center,
          child: Icon(
            Icons.attach_money,
            size: WidgetUtil.widthPercentage(context, 60.0), //TODO colocar este item responsivo
          ),
        ));
  }
}
