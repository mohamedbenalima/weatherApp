import 'package:flutter/material.dart';
import 'package:weatherapp/shared/colors.dart';
import 'package:weatherapp/shared/style.dart';

class CardWeather extends StatelessWidget {
  final String city;
  final String time;
  final String temperature;
  final void Function()? onTap;
  const CardWeather({
    super.key,
    required this.city,
    required this.time,
    required this.temperature,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        color: white.withOpacity(0.65),
        elevation: 10,
        child: InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            title: Text(
              city,
              style: stylePrimary.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
            subtitle: Text(
              time,
              style: stylePrimary.copyWith(
                fontSize: 15,
                color: black,
              ),
            ),
            trailing: Text(
              temperature,
              style: stylePrimary.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
