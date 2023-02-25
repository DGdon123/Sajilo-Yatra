import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'package:location/location.dart';

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

  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map
  LatLng showLocation = LatLng(27.7089427, 85.3086209);

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeMarkers();
    uuid = Uuid();
    sessionToken = uuid.v4();
  }

  Future<void> PlacesAutocompleteField(TextEditingController controller) async {
    final sessionToken = Uuid().v4();
    final Suggestion? result = await showSearch(
      context: context,
      delegate: AddressSearch(sessionToken),
    );

    if (result != null) {
      setState(() {
        controller.text = result.description;
      });
    }
  }

  Future<void> _initializeMarkers() async {
    BitmapDescriptor customMarker =
        await MarkerIcon.getMarkerImage('assets/images/blue_circle.png', 100);
    markers.add(Marker(
      //add marker on google map
      markerId: MarkerId(showLocation.toString()),
      position: showLocation, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: customMarker, //Icon for Marker
    ));
  }

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
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              //Map widget from google_maps_flutter package
              zoomGesturesEnabled: true, //enable Zoom in, out on map
              initialCameraPosition: CameraPosition(
                //innital position in map
                target: showLocation, //initial position
                zoom: 20, //initial zoom level
              ),
              markers: {
                Marker(
                  markerId: MarkerId(showLocation.toString()),
                  position: showLocation,
                ),
              }, //default circle marker for map
              mapType: MapType.normal, //map type
              onMapCreated: (controller) {
                //method called when map is created
                setState(() {
                  mapController = controller;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: fromController,
              decoration: InputDecoration(
                hintText: 'From',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () => PlacesAutocompleteField(fromController),
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: toController,
              decoration: InputDecoration(
                hintText: 'To',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () => PlacesAutocompleteField(toController),
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
