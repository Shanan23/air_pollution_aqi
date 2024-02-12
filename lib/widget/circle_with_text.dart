import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CircleWithText extends StatelessWidget {
  final String pollutan;
  final String location;
  final Color? circleColor;
  final Color shadowColor;
  final String icWeather;

  const CircleWithText({
    Key? key,
    required this.pollutan,
    required this.location,
    required this.circleColor,
    required this.shadowColor,
    required this.icWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Adjust the size of the circle as needed
      height: 200, // Adjust the size of the circle as needed
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: circleColor ?? Colors.red, width: 8.0),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 5.0,
            spreadRadius: 4.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pollutan,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black, // Change the text color as needed
                ),
              ),
              Text(
                "|",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black, // Change the text color as needed
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black, // Change the text color as needed
                    ),
                  ),
                  Text(
                    "Clear air",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black, // Change the text color as needed
                    ),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(
            'assets/icons/$icWeather.png',
            width: 80,
            height: 80,
          ),
          Text(
            DateFormat('dd MMMM yyyy ').format(DateTime.now()),
            style: TextStyle(
              fontSize: 10,
              color: Colors.black, // Change the text color as needed
            ),
          ),
        ],
      ),
    );
  }
}
