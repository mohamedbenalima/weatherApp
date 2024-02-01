import 'package:flutter/material.dart';
import 'package:weatherapp/shared/colors.dart';

class CardWeatherDetails extends StatelessWidget {
  final String title;
  final String value;
  const CardWeatherDetails({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white.withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 18.0,
          top: 12,
          bottom: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
