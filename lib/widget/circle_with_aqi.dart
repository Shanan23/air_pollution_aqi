import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CircleWithAqi extends StatelessWidget {
  final String pollutan;
  final Color? circleColor;

  const CircleWithAqi({
    Key? key,
    required this.pollutan,
    required this.circleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30, // Adjust the size of the circle as needed
      height: 30, // Adjust the size of the circle as needed
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: circleColor ?? Colors.red, width: 3.0),
        
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
                  fontSize: 14,
                  color: Colors.black, // Change the text color as needed
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
