import 'package:flutter/material.dart';

class SpecialtyDetailsPage extends StatelessWidget {
  final Map<String, dynamic> specialty;

  SpecialtyDetailsPage({required this.specialty});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> subjectsByYearSemester =
        specialty['subjectsByYearSemester'];

    return Scaffold(
      appBar: AppBar(
        title: Text(specialty['name']),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(187, 222, 251, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: subjectsByYearSemester.keys.map<Widget>((key) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      key,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(1, 87, 155, 1),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: subjectsByYearSemester[key]!.map<Widget>((subject) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        title: Text(subject['name']),
                        trailing: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(1, 87, 155,
                                1), // Updated to a deep purple for better contrast
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            subject['credits'].toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
