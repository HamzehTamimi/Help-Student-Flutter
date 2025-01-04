import 'package:flutter/material.dart';
import 'package:helpstudent/cards/cards.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
          ),
        ]),
        appBar: AppBar(
          title: const Text('Help Student'),
          backgroundColor: Color.fromRGBO(187, 222, 251, 1),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: (1 / .7),
          children: <Widget>[
              AcademicPlanCard(),
              ITSpecialtyCard(),
              GPACard(),
              MapCard(),
              CVCard(),
          ],
        ),
      );
  }
}
