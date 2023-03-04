import 'package:flutter/material.dart';

import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:sajilo_yatra/map/pages/widgets/zoom_in_out_widget.dart';

import '../../../models/current_location.dart';
import 'info_card_widget.dart';

class MapSuccessWidget extends StatefulWidget {
  const MapSuccessWidget({
    Key? key,
    required this.currentUserLocation,
  }) : super(key: key);
  final CurrentUserLocationEntity currentUserLocation;

  @override
  State<MapSuccessWidget> createState() => _MapSuccessWidgetState();
}

class _MapSuccessWidgetState extends State<MapSuccessWidget> {
  MapboxMapController? mapController;

  _onMapCreated(MapboxMapController controller) async {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapboxMap(
          styleString: 'mapbox://styles/dgdon-123/cletuvw6t000s01pizn0wegij',
          accessToken:
              ('pk.eyJ1IjoiZGdkb24tMTIzIiwiYSI6ImNsZXR1aHhmeTA2ZDEzcXF6c2t0OGtpNGMifQ.R5CddTlVCOw0ohmhYnqdgQ'),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          trackCameraPosition: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.currentUserLocation.latitude,
              widget.currentUserLocation.longitude,
            ),
            zoom: 9.0,
          ),
          onMapClick: (_, latlng) async {
            await mapController?.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  bearing: 10.0,
                  target: LatLng(
                    latlng.latitude,
                    latlng.longitude,
                  ),
                  tilt: 30.0,
                  zoom: 12.0,
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 0,
          child: InfoCardWidget(
            currentUserLocation: widget.currentUserLocation,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * .18,
          right: 10,
          child: ZoomInOutWidget(
            zoomInCallback: () async => await mapController?.animateCamera(
              CameraUpdate.zoomIn(),
            ),
            zoomOutCallback: () async => await mapController?.animateCamera(
              CameraUpdate.zoomOut(),
            ),
          ),
        ),
      ],
    );
  }
}
