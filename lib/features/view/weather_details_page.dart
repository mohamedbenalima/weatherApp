import 'package:flutter/material.dart';
import 'package:weatherapp/features/models/weather_output.dart';
import 'package:weatherapp/features/view/widgets/btn_add_cities.dart';
import 'package:weatherapp/features/view/widgets/card_weather.dart';
import 'package:weatherapp/features/view/widgets/card_weather_details.dart';
import 'package:weatherapp/shared/colors.dart';
import 'package:weatherapp/shared/widgets/body_bg.dart';

class WeatherDetailsPage extends StatelessWidget {
  final WeatherOutput weatherOutput;
  const WeatherDetailsPage({super.key, required this.weatherOutput});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 275,
        leading: BtnAddCities(
          title: 'Détaills de la météo',
          icon: Icons.arrow_back_ios,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: blueAppBar.withOpacity(0.95),
        elevation: 60,
      ),
      body: BodyBg(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardWeather(
                city: weatherOutput.name ?? '',
                time:
                    'Max: ${weatherOutput.main?.temp_max} | Min: ${weatherOutput.main?.temp_min}',
                temperature: '${weatherOutput.main?.temp}°',
                onTap: () {},
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      CardWeatherDetails(
                        title: 'Pays',
                        value: '${weatherOutput.sys?.country}',
                      ),
                      CardWeatherDetails(
                        title: 'Humidité',
                        value: '${weatherOutput.main?.humidity}%',
                      ),
                      CardWeatherDetails(
                        title: 'Feels like',
                        value: '${weatherOutput.main?.feels_like}°',
                      ),
                      CardWeatherDetails(
                        title: 'pression',
                        value: '${weatherOutput.main?.pressure}',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
