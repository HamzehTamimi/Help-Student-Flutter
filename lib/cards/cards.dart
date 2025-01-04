import 'package:flutter/material.dart';
import 'package:helpstudent/screens/map.dart';
import 'package:helpstudent/screens/cv.dart';
import 'package:helpstudent/screens/comingsoon.dart';

class Card extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget targetPage;

  Card(this.icon, this.title, this.targetPage);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(100, 181, 246, 1), width: 2),
        color: Color.fromRGBO(187, 222, 251, 1),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 125,
            color: Color.fromRGBO(1, 87, 155, 1),
          ),
          Text(title,
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(1, 87, 155, 1))),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color.fromRGBO(1, 87, 155, 1),
              foregroundColor: Colors.white,
            ),
            child: const Text('Go To Page'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => targetPage),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MapCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(Icons.location_on, "Maps", Map());
  }
}

class GPACard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(Icons.calculate, "Calculate GPA", Map());
  }
}

class ITSpecialtyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(Icons.computer, "IT Specialties", Map());
  }
}

class CVCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(Icons.person, "CV", CV());
  }
}

class AcademicPlanCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(Icons.school, "Academic Plan", ComingSoon());
  }
}
