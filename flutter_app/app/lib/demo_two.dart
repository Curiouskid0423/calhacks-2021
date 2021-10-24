import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Demo2 extends StatelessWidget {
  const Demo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tumor Detection")),
      body: const Center(
        child: Text('Demo 2'),
      ),
    );
  }
}
