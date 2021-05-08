part of 'user_bloc.dart';

class UserState {
  final bool userExists;
  final User user;

  UserState({User user})
      : this.user = user ?? null,
        userExists = (user != null);
}
