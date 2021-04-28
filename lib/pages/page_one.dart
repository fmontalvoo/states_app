import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:states_app/models/user.dart';

import 'package:states_app/services/user_service.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = context.watch<UserService>();
    // final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Uno'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: userService.deleteUser)
        ],
      ),
      body: userService.userExists
          ? UserInfo(user: userService.user)
          : Center(child: Text('No existe información del usuario')),
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
              ListTile(title: Text('Profesion')),
            ],
          ),
        ));
  }
}
