import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ir a vista de usuarios'),
            ElevatedButton(
              onPressed: () {},
              child: Text('Ver Usuarios'),
            ),
          ],
        ),
      )),
    );
  }
}
