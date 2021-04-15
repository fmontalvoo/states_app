import 'package:flutter/material.dart';

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
            onPressed: () {},
          ),
          MaterialButton(
            child: Text('Cambiar edad'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {},
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
