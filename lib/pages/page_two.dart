import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:states_app/models/user.dart';

import 'package:states_app/services/user_service.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Dos'),
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
              final userService = context.read<UserService>();
              // final userService = Provider.of<UserService>(context, listen: false);
              userService.user =
                  new User(nombre: 'Alan Brito', edad: 24, profesiones: []);
            },
          ),
          MaterialButton(
            child: Text('Cambiar edad'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: context.read<UserService>().cambiarEdad,
          ),
          MaterialButton(
            child: Text('Agregar profesion'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {},
          ),
        ],
      )),
    );
  }
}
