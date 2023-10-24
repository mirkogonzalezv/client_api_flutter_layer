import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poc_network/features/users/presentation/bloc/users_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vista Usuarios'),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          return state.when(
            loading: () => Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            success: (users) {
              return Container(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(users[index].first_name),
                      subtitle: Text(users[index].email),
                    );
                  },
                ),
              );
            },
            error: (message) {
              return Container(
                child: Center(
                  child: Text('Error al obtener datos del servicio'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
