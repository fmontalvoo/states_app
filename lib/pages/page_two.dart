import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/models/user.dart';

import 'package:states_app/bloc/user/user_cubit.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
          if (state is UserLoadedState) return Text(state.user.nombre);
          return Text('Pagina Dos');
        }),
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
              final user = new User(
                  nombre: 'Alan Brito',
                  edad: 24,
                  profesiones: ['Ingeniero de Sistemas', 'Filosofo']);
              userCubit.loadUser(user);
            },
          ),
          MaterialButton(
            child: Text('Cambiar edad'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: userCubit.cambiarEdad,
          ),
          MaterialButton(
            child: Text('Agregar profesion'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              userCubit
                  .agregarProfesiones(['Programador', 'Full stack developer']);
            },
          ),
        ],
      )),
    );
  }
}
