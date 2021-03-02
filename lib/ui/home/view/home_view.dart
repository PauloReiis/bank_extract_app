import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
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
