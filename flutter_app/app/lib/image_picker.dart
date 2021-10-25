import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

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
          children: <Widget>[
            Text("Result sent to server for inference."),
            Text("Task:   Face Detection",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("Key (Developer Use): @yoyoingcolourful",
                style: const TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
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
