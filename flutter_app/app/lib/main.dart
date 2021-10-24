import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Avenir Next'),
      home: const DemoDashboard(title: 'CypherAI'),
    );
  }
}

class DemoDashboard extends StatefulWidget {
  const DemoDashboard({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<DemoDashboard> createState() => _DemoDashboardState();
}

class _DemoDashboardState extends State<DemoDashboard> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the DemoDashboard object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 90,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child:
                    Image.asset('./lib/assets/images/security.png', height: 60),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_demoOne());
              },
              child: const Text('Face Tracking Demo'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_demoTwo());
                },
                child: const Text('Tumor Detection Demo'))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Route _demoOne() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Demo1(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _demoTwo() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Demo2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

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
// >>>>>>>>>>>> Image Picker section >>>>>>>>>>>

class ImagePick extends StatefulWidget {
  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  File? _image;

  Future getImagefromGallery() async {
    final picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 120.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  height: 95,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 85.0,
                    child: Center(
                      child: _image == null
                          ? Text("No videos selected")
                          : Image.file(_image as File),
                    ),
                  )),
            ),
          ),
          SizedBox(
            child: FloatingActionButton(
              onPressed: getImagefromGallery,
              tooltip: "Pick Image",
              child: _image == null
                  ? Icon(Icons.camera_alt)
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(_resultOne());
                      },
                      child: Text("Go!"),
                    ),
            ),
            width: 60,
          )
        ],
      ),
    );
  }
}

Route _resultOne() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Result1(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Result1 extends StatelessWidget {
  const Result1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Inference"), backgroundColor: Colors.blue[200]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Result sent to server for inference.")],
        ),
      ),
    );
  }
}
