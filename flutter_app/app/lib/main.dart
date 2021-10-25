import 'package:app/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cypher AI Demo',
      theme: ThemeData(primarySwatch: Colors.indigo, fontFamily: 'Avenir Next'),
      home: const Login(),
    );
  }
}
