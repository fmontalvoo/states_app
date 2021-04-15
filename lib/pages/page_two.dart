import 'package:flutter/material.dart';

import 'package:states_app/models/user.dart';

import 'package:states_app/services/user_service.dart';

class PageTwo extends StatelessWidget {
  final userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<User>(
          stream: userService.userStream,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Text(snapshot.data.nombre)
                : Text('Pagina Dos');
          },
        ),
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
              final user =
                  new User(nombre: 'Alan Brito', edad: 24, profesiones: []);
              userService.loadUsers(user);
            },
          ),
          MaterialButton(
            child: Text('Cambiar edad'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              userService.cambiarEdad();
            },
          ),
          MaterialButton(
            child: Text('Agregar profesion'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              List<String> profesiones = ['Ingeniero', 'Filosofo'];
              userService.agregarProfesiones(profesiones);
            },
          ),
        ],
      )),
    );
  }
}
