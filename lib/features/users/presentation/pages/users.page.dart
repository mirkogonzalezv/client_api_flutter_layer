import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vista Usuarios'),
      ),
      body: Container(
        child: Center(
          child: Text('Users Pages'),
        ),
      ),
    );
  }
}
