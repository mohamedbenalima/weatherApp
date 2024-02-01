import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/features/view/home_page.dart';
import 'package:weatherapp/features/view_models/providers/weather_provider.dart';
import 'package:weatherapp/shared/colors.dart';
import 'package:weatherapp/shared/config.dart';
import 'package:weatherapp/shared/style.dart';
import 'package:weatherapp/shared/widgets/body_bg.dart';

class AddCityPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  AddCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: white,
          ),
        ),
        title: Text('Add City', style: stylePrimary),
        backgroundColor: Colors.transparent,
      ),
      body: BodyBg(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0, right: 12, left: 12),
              child: GooglePlacesAutoCompleteTextFormField(
                style: TextStyle(color: black, fontWeight: FontWeight.bold),
                inputDecoration: InputDecoration(
                  focusColor: white,
                  hintStyle: TextStyle(color: white),
                  hintText: 'Ajouter votre ville ici',
                  fillColor: white.withOpacity(0.5),
                  border: const OutlineInputBorder(),
                ),
                textEditingController: controller,
                // Make sure to set the API Key in the config file.
                googleAPIKey: keyGoogleMaps,
                debounceTime: 400,
                // if you require the coordinates from the place details
                isLatLngRequired: true,
                getPlaceDetailWithLatLng: (prediction) async {
                  log("placeDetails ${prediction.lng} ${prediction.lat}");

                  context.read<WeatherProvider>().displayCitie(
                        lat: double.parse(prediction.lat ?? "0"),
                        lng: double.parse(prediction.lng ?? "0"),
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                // this callback is called when isLatLngRequired is true
                itmClick: (prediction) {
                  controller.text = prediction.description!;
                  controller.selection = TextSelection.fromPosition(
                    TextPosition(
                      offset: prediction.description!.length,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
