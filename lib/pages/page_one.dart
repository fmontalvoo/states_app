import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states_app/models/user.dart';

import 'package:states_app/bloc/user/user_cubit.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Uno'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: context.read<UserCubit>().deleteUser,
          )
        ],
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          // if (state is UserInitialState) return Center(child: Text('No existe información del usuario'));
          // if (state is UserLoadedState) return UserInfo(user: state.user);

          switch (state.runtimeType) {
            case UserInitialState:
              return Center(child: Text('No existe información del usuario'));
              break;
            case UserLoadedState:
              return UserInfo(user: (state as UserLoadedState).user);
              break;
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () {
          Navigator.pushNamed(context, 'two');
        },
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('General',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Divider(),
              ListTile(title: Text('Nombre: ${user.nombre}')),
              ListTile(title: Text('Edad: ${user.edad}')),
              Text('Profesiones',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              Divider(),
              ...user.profesiones
                  .map((profesion) => ListTile(title: Text(profesion)))
                  .toList()
            ],
          ),
        ));
  }
}
