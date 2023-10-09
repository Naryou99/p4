import 'package:flutter/material.dart';
import 'package:latihan_4/HttpHelper.dart';
import 'dart:convert';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late Map<String, dynamic> weatherData;
  late HttpHelper helper;

  @override
  void initState() {
    super.initState();
    helper = HttpHelper();
    weatherData = {};

    helper.Medan().then((value) {
      setState(() {
        weatherData = json.decode(value);
      });
    });
  }

  Color _getCardColor(double temperature) {
    return temperature > 20 ? Colors.red : Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    double temperature =
        weatherData.containsKey('main') ? weatherData['main']['temp'] - 2 : 0;
    String location = weatherData.containsKey('name')
        ? weatherData['name']
        : 'Unknown Location';

    return Scaffold(
      appBar: AppBar(title: Text('Weather Information')),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            color: _getCardColor(temperature),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    temperature > 20 ? Icons.wb_sunny : Icons.ac_unit,
                    size: 50,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Temperature: ${temperature.toStringAsFixed(2)}°C',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Location: $location',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
