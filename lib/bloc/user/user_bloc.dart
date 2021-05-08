import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';

import 'package:states_app/models/user.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is LoadUserEvent) yield state.copyWith(user: event.user);

    if (event is ChangeUserAgeEvent) {
      int edad = state.user.edad;
      yield state.copyWith(user: state.user.copyWith(edad: edad += event.edad));
    }

    if (event is AddUserProfessionsEvent)
      yield state.copyWith(
          user: state.user.copyWith(
              profesiones: [...state.user.profesiones, ...event.profesiones]));

    if (event is DeleteUserEvent) yield state.initialState();
  }
}
