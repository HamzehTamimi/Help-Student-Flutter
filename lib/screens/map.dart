import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(FirstApp());
}

class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Helper Student",
      home: Map(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Ccontainer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 147, 224),
        title: const Text(
          "Map",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}

class Ccontainer extends StatelessWidget {
  // رابط الخريطة
  final String mapUrl =
      "https://www.google.com/maps/d/viewer?hl=ar&mid=1hFwEahSBrdebkXl0Uy0-lojiRiY30g4&ll=32.49759881514722%2C35.98446569229725&z=15";

  // دالة لفتح الرابط
  Future<void> _launchURL() async {
    final Uri _url = Uri.parse(mapUrl);

    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $mapUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 40),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 54, 147, 224),
          width: 5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "images/Screenshot_2-1-2025_20246_.jpeg",
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 10), // مسافة بين الصور
          Image.asset(
            "images/Screenshot_2-1-2025_20141_.jpeg",
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 20), // مسافة بين الصور والزر
          ElevatedButton(
            onPressed: _launchURL, // عند الضغط على الزر يتم فتح الرابط
            child: const Text('Go To Map'),
          ),
        ],
      ),
    );
  }
}