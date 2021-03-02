import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  /// **Conceito:** Montando a tela de extrato
  /// **Autor:** Paulo Reis / **Data:** 28/02/2021 / **Versão:** 1.0
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "data",
          style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
