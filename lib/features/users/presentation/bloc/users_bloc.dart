import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poc_network/features/users/domain/repositories/user_repository.dart';
import 'package:flutter_poc_network/features/users/domain/usecases/users_usescases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user.dart';

part 'users_event.dart';
part 'users_state.dart';
part 'users_bloc.freezed.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepository _usersUsesCases = UsersUsesCasesImpl();
  UsersBloc() : super(UsersState.loading()) {
    on<_Started>(_started);
  }

  _started(_Started event, Emitter<UsersState> emit) async {
    emit(UsersState.loading());
    log('_Started');
    var resultUsers = await _usersUsesCases.getAllUsers();

    await resultUsers.when(
      exito: (data) {
        // emitimos el exito
        emit(UsersState.success(users: data.data!));
      },
      fallo: (error) {
        // emitimos el fallo
        emit(UsersState.error());
      },
    );
  }
}
