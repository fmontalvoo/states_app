import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  void loadUser(User user) {
    emit(UserLoadedState(user));
  }

  void cambiarEdad() {
    final currentState = state;
    if (currentState is UserLoadedState) {
      int edad = currentState.user.edad;
      emit(UserLoadedState(currentState.user.copyWith(edad: ++edad)));
    }
  }

  void agregarProfesiones(List<String> profesiones) {
    final currentState = state;
    if (currentState is UserLoadedState) {
      profesiones = currentState.user.profesiones + profesiones;
      emit(UserLoadedState(
          currentState.user.copyWith(profesiones: profesiones)));
    }
  }

  void deleteUser() {
    emit(UserInitialState());
  }
}
