import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ITSpecialtiesScreen(),
    );
  }
}

class ITSpecialtiesScreen extends StatelessWidget {
  final List<String> specialties = [
    "Internet Of Things",
    "Cybersecurity",
    "Artificial Intelligence",
    "Computer Games Design And Development",
    "Data Science",
    "Robotics Science",
    "Computer Science",
    "Computer Information Systems",
    "Health Information Systems",
    "Software Engineering",
    "Computer Engineering",
    "Network Engineering And Security",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IT Specialties'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(187, 222, 251, 1),
      ),
      body: ListView.builder(
        itemCount: specialties.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromRGBO(1, 87, 155, 1),
              child: Text(
                '${index + 1}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              specialties[index],
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward, color: Colors.black54),
            onTap: () {
              if (specialties[index] == "Computer Information Systems") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AcademicPlanScreen(),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class AcademicPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academic Plan'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(187, 222, 251, 1),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // First Year Section
          SectionWidget(
            title: 'First year',
            courses: [
              CourseWidget(name: 'Communication Skills in Arabic', credits: 3),
              CourseWidget(name: 'Introduction to Information Technology', credits: 3),
              CourseWidget(name: 'Calculas 1', credits: 3),
              CourseWidget(name: 'Programming in C++', credits: 3),

            ],
          ),
          SizedBox(height: 16),
          // Second Year Section
          SectionWidget(
            title: 'Second year',
            courses: [
              CourseWidget(name: 'Calculas 2', credits: 3),
              CourseWidget(name: 'OOP Programming', credits: 3),
              CourseWidget(name: 'Discrete Mathematics', credits: 3),
              CourseWidget(name: 'Management Information Systems', credits: 3),
              CourseWidget(name: 'Pet Animal Care', credits: 3),

            ],
          ),
          SizedBox(height: 16),
          // Third Year Section
          SectionWidget(
            title: 'Third year',
            courses: [
              CourseWidget(name: 'Software Engineering', credits: 3),
              CourseWidget(name: 'Data Structures', credits: 3),
              CourseWidget(name: 'Computer Networks', credits: 3),
              CourseWidget(name: 'Web Application ', credits: 3),
              CourseWidget(name: 'Database ', credits: 3),
            ],
          ),
          SizedBox(height: 16),
          // Fourth Year Section
          SectionWidget(
            title: 'Fourth year',
            courses: [
              CourseWidget(name: 'Big Data', credits: 3),
              CourseWidget(name: 'Machine Learning', credits: 3),
              CourseWidget(name: 'Financial Accounting Analysis', credits: 3),
              CourseWidget(name: 'Project Management', credits: 3),
              CourseWidget(name: 'Graduation Project', credits:2),
            ],
          ),
        ],
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final String title;
  final List<Widget> courses;

  SectionWidget({required this.title, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(1, 87, 155, 1),
          ),
        ),
        ...courses,
      ],
    );
  }
}

class CourseWidget extends StatelessWidget {
  final String name;
  final int credits;

  CourseWidget({required this.name, required this.credits});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(187, 222, 251, 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: TextStyle(fontSize: 16)),
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(1, 87, 155, 1),
                    child: Text(
                      '$credits',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}