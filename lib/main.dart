import 'package:final_630710636/models/Tap.dart';
import 'package:flutter/material.dart';

import 'models/tap.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(
              255, 210, 231, 250), // ตั้งค่าพื้นหลังของ AppBar เป็นสีขาว
        ),
      ),
      home: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'Bangkok',
                  ),
                  Tab(
                    text: 'Petchaburi',
                  ),
                  Tab(
                    text: 'Nakhon Pathom',
                  ),
                ],
                labelColor: Colors
                    .grey, // Change the text color of the active tab to blue
                unselectedLabelColor: Colors
                    .black, // Change the text color of inactive tabs to black
              ),
            ),
            body: TabBarView(
              children: [
                WeatherTab(city: 'bangkok'),
                WeatherTab(city: 'petchaburi'),
                WeatherTab(city: 'nakhon_pathom'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


void main() {
  runApp(WeatherApp());
}
