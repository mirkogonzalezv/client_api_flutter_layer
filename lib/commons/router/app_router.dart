import 'package:flutter/material.dart';
import 'package:flutter_poc_network/features/home/presentation/pages/home.page.dart';
import 'package:flutter_poc_network/features/users/presentation/pages/users.page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/users',
      name: 'users',
      builder: (context, state) => UsersPage(),
    ),
  ],
  errorPageBuilder: (context, state) {
    return MaterialPage(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Text('Error ruta no existe'),
          ),
        ),
      ),
    );
  },
);
