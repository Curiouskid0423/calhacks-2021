import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

import 'demo_one.dart';
import 'demo_two.dart';

class DemoDashboard extends StatefulWidget {
  const DemoDashboard({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<DemoDashboard> createState() => _DemoDashboardState();
}

class _DemoDashboardState extends State<DemoDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
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
      ),
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
