import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:states_app/models/user.dart';

import 'package:states_app/controllers/user_controller.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title:
            Obx(() => Text(userController.user.value?.nombre ?? 'Pagina Dos')),
        actions: [
          IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: () => Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark()))
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Text('Establecer usuario'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              userController.loadUser(new User(
                  nombre: 'Alan Brito',
                  edad: 24,
                  profesiones: ['Ingeniero de Sistemas', 'Filosofo']));

              Get.snackbar('Usuario establecido',
                  'La informacion del usuario se ha cargado...',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    BoxShadow(color: Colors.black45, blurRadius: 10.0)
                  ]);
            },
          ),
          MaterialButton(
            child: Text('Cambiar edad'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: userController.cambiarEdad,
          ),
          MaterialButton(
            child: Text('Agregar profesion'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () => userController
                .agregarProfesiones(['Programador', 'Full stack developer']),
          ),
        ],
      )),
    );
  }
}
