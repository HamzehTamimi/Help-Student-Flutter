import 'package:flutter/material.dart';

class GuidanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guidance'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(187, 222, 251, 1),
      ),
      body: Center(
        child: Text(
          'Welcome to the Guidance Screen!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
