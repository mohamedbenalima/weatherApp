import 'package:flutter/material.dart';
import 'package:weatherapp/shared/colors.dart';
import 'package:weatherapp/shared/style.dart';

class BtnAddCities extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final IconData icon;
  const BtnAddCities({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: whiteYellow,
          size: 20,
        ),
        title: Text(
          title,
          style: stylePrimary.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}
