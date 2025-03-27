import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:helpstudent/screens/speciality/specialtydetails.dart';
import 'package:http/http.dart' as http;

class ITSpecialtiesScreen extends StatefulWidget {
  @override
  _ITSpecialtiesScreenState createState() => _ITSpecialtiesScreenState();
}

class _ITSpecialtiesScreenState extends State<ITSpecialtiesScreen> {
  List<Map<String, dynamic>> specialties = [];

  @override
  void initState() {
    super.initState();
    fetchSpecialties();
  }

  // fetch the data
  Future<void> fetchSpecialties() async {
    final response =
        await http.get(Uri.parse('http://localhost:2000/specialties'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        specialties = data.map((e) => e as Map<String, dynamic>).toList();
      });
    } else {
      throw Exception('Failed to load specialties');
    }
  }

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
          final specialty = specialties[index];
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(specialty['name']),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SpecialtyDetailsPage(specialty: specialty),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
