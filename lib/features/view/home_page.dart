import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/features/view/add_city_page.dart';
import 'package:weatherapp/features/view/weather_details_page.dart';
import 'package:weatherapp/features/view/widgets/btn_add_cities.dart';
import 'package:weatherapp/features/view/widgets/card_weather.dart';
import 'package:weatherapp/features/view_models/providers/weather_provider.dart';
import 'package:weatherapp/shared/colors.dart';
import 'package:weatherapp/shared/widgets/body_bg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 250,
        leading: BtnAddCities(
          title: 'Ajouter des villes',
          icon: Icons.arrow_back_ios,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCityPage()),
            );
          },
        ),
        backgroundColor: blueAppBar.withOpacity(0.95),
        elevation: 60,
      ),
      body: BodyBg(
        child: context.watch<WeatherProvider>().isLoading
            ? Center(child: CircularProgressIndicator(color: white))
            : Padding(
                padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
                child: ListView.builder(
                  itemCount: context.watch<WeatherProvider>().cities.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardWeather(
                      city:
                          context.watch<WeatherProvider>().cities[index].name ??
                              '',
                      time:
                          'Max: ${context.watch<WeatherProvider>().cities[index].main?.temp_max}° | Min: ${context.watch<WeatherProvider>().cities[index].main?.temp_min}°',
                      temperature:
                          '${context.watch<WeatherProvider>().cities[index].main?.temp}°',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherDetailsPage(
                              weatherOutput: context
                                  .watch<WeatherProvider>()
                                  .cities[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
      ),
    );
  }
}
