import 'package:flutter/material.dart';

import 'package:states_app/models/user.dart';

class UserService with ChangeNotifier {
  User _user;

  User get user => this._user;

  set user(User user) {
    this._user = user;
    notifyListeners();
  }

  void cambiarEdad() {
    if (this._user != null) {
      this._user.edad++;
      notifyListeners();
    }
  }

  void deleteUser() {
    this._user = null;
    notifyListeners();
  }

  void agregarProfesiones(List<String> profesiones) {
    this._user.profesiones.addAll(profesiones);
    notifyListeners();
  }

  bool get userExists => (this._user != null);
}
