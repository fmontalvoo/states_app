import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:states_app/models/user.dart';

import 'package:states_app/controllers/user_controller.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Uno'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete), onPressed: userController.deleteUser),
        ],
      ),
      body: Obx(() => userController.userExists.value
          ? UserInfo(user: userController.user.value)
          : Center(child: Text('No existe información del usuario'))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Get.toNamed('two'),
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
