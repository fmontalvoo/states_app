import 'package:flutter/material.dart';
import 'package:states_app/models/user.dart';

import 'package:states_app/services/user_service.dart';

class PageOne extends StatelessWidget {
  final userService = UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina Uno')),
      body: StreamBuilder<User>(
          stream: userService.userStream,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? UserInfo(user: snapshot.data)
                : Center(child: Text('No existe información del usuario'));
          }),
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
                  .toList(),
            ],
          ),
        ));
  }
}
