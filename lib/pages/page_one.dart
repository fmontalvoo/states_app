import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina Uno')),
      body: UserInfo(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Get.toNamed('two'),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key key,
  }) : super(key: key);

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
              ListTile(title: Text('Nombre:')),
              ListTile(title: Text('Edad:')),
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
