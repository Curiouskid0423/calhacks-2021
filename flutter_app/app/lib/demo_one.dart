import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'image_picker.dart';

class Demo1 extends StatelessWidget {
  const Demo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Face Tracking")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Upload a video",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 180, child: ImagePick())
          ],
        ),
      ),
    );
  }
}
