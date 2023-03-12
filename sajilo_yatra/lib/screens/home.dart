import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'package:sajilo_yatra/screens/prepare_ride.dart';

import '../helpers/shared_prefs.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LatLng? currentLocation;
  String? currentAddress;
  late CameraPosition _initialCameraPosition;

  @override
  void initState() {
    super.initState();
    currentLocation = getCurrentLatLngFromSharedPrefs();
    currentAddress = getCurrentAddressFromSharedPrefs();
    _initialCameraPosition = currentLocation != null
        ? CameraPosition(target: currentLocation!, zoom: 14)
        : const CameraPosition(target: LatLng(27.7172, 85.3240), zoom: 14);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MapboxMap(
          accessToken: dotenv.env[
              'pk.eyJ1IjoiZGdkb24tMTIzIiwiYSI6ImNsZXZxaGg4MDA3OW4zcGtjcnowNnE5YzIifQ.LN_GIFZ0LVgXL95ZqX7FEQ'],
          initialCameraPosition: _initialCameraPosition,
          myLocationEnabled: true,
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Hi there!',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Text('You are currently here:'),
                      Text(currentAddress ?? '',
                          style: const TextStyle(color: Colors.indigo)),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const PrepareRide())),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(20)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Where do you wanna go today?'),
                              ])),
                    ]),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
