part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class LoadUserEvent extends UserEvent {
  final User user;

  LoadUserEvent(this.user);
}

class ChangeUserAgeEvent extends UserEvent {
  final int edad;

  ChangeUserAgeEvent(this.edad);
}

class AddUserProfessionsEvent extends UserEvent {
  final List<String> profesiones;

  AddUserProfessionsEvent(this.profesiones);
}

class DeleteUserEvent extends UserEvent {}
