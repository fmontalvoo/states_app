import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/models/user.dart';

import 'package:states_app/bloc/user/user_bloc.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final blocProvider = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) => Text(state.user?.nombre ?? 'Pagina Dos'),
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
              final user = new User(
                  nombre: 'Alan Brito',
                  edad: 24,
                  profesiones: ['Ingeniero de Sistemas', 'Filosofo']);

              // context.read<UserBloc>().add(LoadUserEvent(user));
              blocProvider.add(LoadUserEvent(user));
            },
          ),
          MaterialButton(
            child: Text('Cambiar edad'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              blocProvider.add(ChangeUserAgeEvent(1));
            },
          ),
          MaterialButton(
            child: Text('Agregar profesion'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              blocProvider.add(AddUserProfessionsEvent(
                  ['Programador', 'Full stack developer']));
            },
          ),
        ],
      )),
    );
  }
}
