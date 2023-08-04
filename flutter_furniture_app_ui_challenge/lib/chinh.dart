import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body:  Column(
        children: <Widget>[
           Image.asset('assets/svg/chinh.jpg'),
           const Text('This is a cat.'),
        ],
      ),
    );
  }
}