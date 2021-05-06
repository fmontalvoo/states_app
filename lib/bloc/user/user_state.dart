part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitialState extends UserState {
  final userExists = false;
}

class UserLoadedState extends UserState {
  final userExists = true;
  final User user;

  UserLoadedState(this.user);
}
