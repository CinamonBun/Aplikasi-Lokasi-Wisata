import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Aplikasi Pemetaan Lokasi Wisata'),
            backgroundColor: Colors.black,
          ),
          body: Column(children: <Widget>[
            Image.network('https://www.petanikode.com/img/flutter/flutter.png',
                scale: 1.0),
            Text(
              'Aplikasi Pemetaan Lokasi Wisata',
              style: TextStyle(fontSize: 24, fontFamily: 'Lexend'),
            ),
            Text('By CinamonBun'),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.network('https://picsum.photos/250?image=9',
                      scale: 1.0),
                  Image.network('https://picsum.photos/250?image=9', scale: 1.0)
                ])
          ])),
    );
  }
}
