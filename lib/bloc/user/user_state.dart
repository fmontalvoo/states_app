part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitialState extends UserState {
  final userExists = false;
}
