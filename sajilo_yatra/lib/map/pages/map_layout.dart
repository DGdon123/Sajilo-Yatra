import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sajilo_yatra/map/pages/widgets/location_error_widget.dart';
import 'package:sajilo_yatra/map/pages/widgets/map_success_widget.dart';

import '../../bloc/location_bloc.dart';

class MapLayout extends StatelessWidget {
  const MapLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        buildWhen: (previous, current) =>
            current.status.isLoading ||
            current.status.isError ||
            current.status.isSuccess,
        builder: (context, state) {
          if (state.status.isSuccess) {
            return MapSuccessWidget(
              currentUserLocation: state.currentUserLocation,
            );
          }
          if (state.status.isError) {
            return LocationErrorWidget(
              errorMessage: state.errorMessage,
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
