import 'dart:async';

import 'package:states_app/models/user.dart';

class UserService {
  static final _userService = new UserService._();
  User _user;

  StreamController<User> _streamController =
      new StreamController<User>.broadcast();

  factory UserService() {
    return _userService;
  }

  UserService._();

  User get user => this._user;

  void loadUsers(User user) {
    this._user = user;
    this._streamController.add(this._user);
  }

  void cambiarEdad() {
    if (this._user != null) {
      this._user.edad++;
      this._streamController.add(this._user);
    }
  }

  void agregarProfesiones(List<String> profesiones) {
    if (this._user != null) {
      this._user.profesiones = profesiones;
      this._streamController.add(this._user);
    }
  }

  bool get userExists => (this._user != null);

  Stream<User> get userStream => this._streamController.stream;

  void dispose() {
    _streamController?.close();
  }
}
