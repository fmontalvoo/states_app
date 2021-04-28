import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:states_app/models/user.dart';

import 'package:states_app/services/user_service.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = context.watch<UserService>();

    return Scaffold(
      appBar: AppBar(
        title: Text(userService.user?.nombre ?? 'Pagina Dos'),
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
              userService.user = new User(
                  nombre: 'Alan Brito',
                  edad: 24,
                  profesiones: ['Ingeniero de Sistemas', 'Filosofo']);
            },
          ),
          MaterialButton(
            child: Text('Cambiar edad'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: userService.cambiarEdad,
            // onPressed: context.read<UserService>().cambiarEdad,
          ),
          MaterialButton(
            child: Text('Agregar profesion'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              userService
                  .agregarProfesiones(['Programador', 'Full stack developer']);
            },
          ),
        ],
      )),
    );
  }
}
