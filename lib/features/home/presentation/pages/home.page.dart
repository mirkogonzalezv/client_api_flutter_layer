import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../users/presentation/bloc/users_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: BlocListener<UsersBloc, UsersState>(
        listener: (context, state) {
          state.when(
            loading: () {},
            success: (users) {
              log("Se emite y se obtienen los usuarios");
              context.push('/users');
            },
            error: (message) {},
          );
        },
        child: Container(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ir a vista de usuarios'),
              ElevatedButton(
                onPressed: () {
                  log('Click');
                  BlocProvider.of<UsersBloc>(context).add(UsersEvent.started());
                },
                child: Text('Ver Usuarios'),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
