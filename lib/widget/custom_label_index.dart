import 'package:flutter/material.dart';

class CustomLabelIndex extends StatelessWidget {
  final String pollutan;
  final String image;
  final String desc;
  final Color? darkColor;
  final Color? lightColor;

  const CustomLabelIndex({
    Key? key,
    required this.pollutan,
    required this.image,
    required this.desc,
    required this.darkColor,
    required this.lightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft:
                        Radius.circular(10)), // Adding corner radius to the row
                color: darkColor, // Setting container color dynamically
              ),
              height: 80,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pollutan,
                      style: TextStyle(
                        color:
                            (desc == "Moderate") ? Colors.black : Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "AQI",
                      style: TextStyle(
                        color:
                            (desc == "Moderate") ? Colors.black : Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight:
                        Radius.circular(10)), // Adding corner radius to the row
                color: lightColor, // Setting container color dynamically
              ),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image, // Replace with your image path
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    height: 30,
                    width: 20,
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      color: (desc == "Moderate") ? Colors.black : Colors.white,
                      fontSize: 16,
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
