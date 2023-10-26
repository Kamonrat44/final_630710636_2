import 'dart:convert';

import 'package:final_630710636/models/tap.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherTab extends StatefulWidget {
  final String city;

  const WeatherTab({
    Key? key,
    required this.city,
  }) : super(key: key);

  @override
  _WeatherTabState createState() => _WeatherTabState();
}
