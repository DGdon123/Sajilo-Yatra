import 'dart:convert';

import '../requests/mapbox_directions.dart';
import '../requests/mapbox_rev_geocoding.dart';
import '../requests/mapbox_search.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

// ----------------------------- Mapbox Search Query -----------------------------
String getValidatedQueryFromQuery(String query) {
  // Remove whitespaces
  String validatedQuery = query.trim();
  return validatedQuery;
}

Future<List<Map<String, dynamic>>> getParsedResponseForQuery(
    String value) async {
  List<Map<String, dynamic>> parsedResponses = [];

  // If empty query send blank response
  String query = getValidatedQueryFromQuery(value);
  if (query == '') return parsedResponses;

  // Else search and then send response
  Map<String, dynamic> responseMap =
      await getSearchResultsFromQueryUsingMapbox(query);
  String responseString = json.encode(responseMap);
  var response = json.decode(responseString);

  List features = response['features'];
  for (var feature in features) {
    Map<String, dynamic> response = {
      'name': feature['text'],
      'address': feature['place_name'].split('${feature['text']}, ')[1],
      'place': feature['place_name'],
      'location': LatLng(feature['center'][1], feature['center'][0])
    };
    parsedResponses.add(response);
  }
  return parsedResponses;
}

// ----------------------------- Mapbox Reverse Geocoding -----------------------------
Future<Map<String, dynamic>> getParsedReverseGeocoding(LatLng latLng) async {
  var response = await getReverseGeocodingGivenLatLngUsingMapbox(latLng);
  Map<String, dynamic> feature = response['features'][0];
  Map<String, dynamic> revGeocode = {
    'name': feature['text'],
    'address': feature['place_name'].split('${feature['text']}, ')[1],
    'place': feature['place_name'],
    'location': latLng
  };
  return revGeocode;
}

// ----------------------------- Mapbox Directions API -----------------------------
Future<Map<String, dynamic>> getDirectionsAPIResponse(
    LatLng sourceLatLng, LatLng destinationLatLng) async {
  final response =
      await getCyclingRouteUsingMapbox(sourceLatLng, destinationLatLng);
  Map<String, dynamic> geometry = response['routes'][0]['geometry'];
  num duration = response['routes'][0]['duration'];
  num distance = response['routes'][0]['distance'];

  Map<String, dynamic> modifiedResponse = {
    "geometry": geometry,
    "duration": duration,
    "distance": distance,
  };
  return modifiedResponse;
}

LatLng getCenterCoordinatesForPolyline(Map<String, dynamic> geometry) {
  List coordinates = geometry['coordinates'];
  int pos = (coordinates.length / 2).round();
  return LatLng(coordinates[pos][1], coordinates[pos][0]);
}
