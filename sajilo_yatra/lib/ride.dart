import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_api_headers/google_api_headers.dart';

import 'package:google_maps_webservice/places.dart';

import 'marker_icon.dart';
import 'models/suggestion.dart';

class TenthRoute extends StatefulWidget {
  const TenthRoute({Key? key}) : super(key: key);

  @override
  State<TenthRoute> createState() => _TenthRouteState();
}

class _TenthRouteState extends State<TenthRoute> {
  late final Uuid uuid;
  late final String sessionToken;

  var vehicle = ['Bus', 'Jeep', 'MicroBus', 'Taxi', 'Others'];
  DateTime? dob;
  TextEditingController dobController = TextEditingController();
  DateTime? dob2;
  TextEditingController dobController2 = TextEditingController();

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  String googleApikey = "AIzaSyBiaCtZxylkA-k_S7RUedlxNSrcor2Vsw8";
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(27.6602292, 85.308027); 
  String location = "Search Location"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFFFFFFFF),
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/seventh');
                },
              );
            },
          ),
          backgroundColor: Color(0xFF222222),
          title: const Text('Ride',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: 'Roboto Bold',
                fontSize: 22,
                height: 1.19,
                fontWeight: FontWeight.w500,
              )),
        ),
        body: Stack(children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: startLocation, //initial position
              zoom: 14.0, //initial zoom level
            ),
            mapType: MapType.normal, //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() {
                mapController = controller;
              });
            },
            onCameraMove: (CameraPosition cameraPositiona) {
              cameraPosition = cameraPositiona;
            },
            onCameraIdle: () async {
              List<Placemark> placemarks = await placemarkFromCoordinates(
                  cameraPosition!.target.latitude,
                  cameraPosition!.target.longitude);
              setState(() {
                location = placemarks.first.administrativeArea.toString() +
                    ", " +
                    placemarks.first.street.toString();
              });
            },
          ),

          Center(
            //picker image on google map
            child: Image.asset(
              "assets/images/picker.png",
              width: 80,
            ),
          ),

          //search autoconplete input
          Positioned(
              //search input bar
              top: 10,
              child: InkWell(
                  onTap: () async {
                    var place = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: googleApikey,
                        mode: Mode.overlay,
                        types: [],
                        strictbounds: false,
                        components: [Component(Component.country, 'np')],
                        //google_map_webservice package
                        onError: (err) {
                          print(err);
                        });

                    if (place != null) {
                      setState(() {
                        location = place.description.toString();
                      });
                      //form google_maps_webservice package
                      final plist = GoogleMapsPlaces(
                        apiKey: googleApikey,
                        apiHeaders: await GoogleApiHeaders().getHeaders(),
                        //from google_api_headers package
                      );
                      String placeid = place.placeId ?? "0";
                      final detail = await plist.getDetailsByPlaceId(placeid);
                      final geometry = detail.result.geometry!;
                      final lat = geometry.location.lat;
                      final lang = geometry.location.lng;
                      var newlatlang = LatLng(lat, lang);

                      //move map camera to selected place with animation
                      mapController?.animateCamera(
                          CameraUpdate.newCameraPosition(
                              CameraPosition(target: newlatlang, zoom: 17)));
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      child: Container(
                          padding: EdgeInsets.all(0),
                          width: MediaQuery.of(context).size.width - 40,
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/picker.png",
                              width: 25,
                            ),
                            title: Text(
                              location,
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing: Icon(Icons.search),
                            dense: true,
                          )),
                    ),
                  )))
        ]));
  }
}

class AddressSearch extends SearchDelegate<Suggestion> {
  final sessionToken;

  AddressSearch(this.sessionToken);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        toolbarTextStyle: theme.textTheme
            .copyWith(
              headline6: theme.textTheme.headline6!
                  .copyWith(color: Colors.white, fontSize: 18),
            )
            .bodyText2,
        titleTextStyle: theme.textTheme
            .copyWith(
              headline6: theme.textTheme.headline6!
                  .copyWith(color: Colors.white, fontSize: 18),
            )
            .headline6,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pushNamed(context, '/eighth');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // This is where the selected result is returned
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: getSuggestions(query, sessionToken),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final suggestions = snapshot.data as List<Suggestion>;
        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
            return ListTile(
              title: Text(suggestion.description),
              onTap: () {
                close(context, suggestion);
              },
            );
          },
        );
      },
    );
  }

  Future<List<Suggestion>> getSuggestions(
      String query, String sessionToken) async {
    final apiKey = 'AIzaSyBiaCtZxylkA-k_S7RUedlxNSrcor2Vsw8';
    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&sessiontoken=$sessionToken&key=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final predictions =
          json.decode(await response.body)['predictions'] as List<dynamic>;
      final suggestions = predictions
          .map<Suggestion>((p) => Suggestion(
                p['place_id'] as String,
                p['description'] as String,
              ))
          .toList();

      return suggestions;
    } else {
      throw Exception(
          'Failed to get suggestions (status code ${response.statusCode}): ${response.body}');
    }
  }
}
