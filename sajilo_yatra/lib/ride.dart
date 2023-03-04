import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class TenthRoute extends StatefulWidget {
  const TenthRoute({Key? key}) : super(key: key);

  @override
  State<TenthRoute> createState() => _TenthRouteState();
}

class _TenthRouteState extends State<TenthRoute> {
  MapboxMapController? mapController;
  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    _determinePosition().then((position) {
      setState(() {
        currentPosition = position;
      });
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapbox Example'),
      ),
      body: currentPosition == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : MapboxMap(
              accessToken:
                  'pk.eyJ1IjoiZGdkb24tMTIzIiwiYSI6ImNsZXR1aHhmeTA2ZDEzcXF6c2t0OGtpNGMifQ.R5CddTlVCOw0ohmhYnqdgQ',
              onMapCreated: (controller) => mapController = controller,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  currentPosition!.latitude,
                  currentPosition!.longitude,
                ),
                zoom: 15,
              ),
              myLocationEnabled: true,
              myLocationRenderMode: MyLocationRenderMode.GPS,
              myLocationTrackingMode: MyLocationTrackingMode.Tracking,
            ),
    );
  }
}
