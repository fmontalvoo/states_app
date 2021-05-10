import 'package:get/get.dart';

import 'package:states_app/models/user.dart';

class UserController extends GetxController {
  var userExists = false.obs;
  var user = new User().obs;

  void loadUser(User user) {
    this.userExists.value = true;
    this.user.value = user;
  }

  void cambiarEdad() {
    this.user.update((user) => user?.edad++);
  }

  void agregarProfesiones(List<String> profesiones) {
    this.user.update((user) => user?.profesiones += profesiones);
  }

  void deleteUser() {
    this.user.value = new User();
    this.userExists.value = false;
  }
}
