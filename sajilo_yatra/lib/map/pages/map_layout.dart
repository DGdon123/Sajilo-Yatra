import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../location/bloc/location_bloc.dart';
import '../../location/widgets/location_error_widget.dart';
import '../widgets/map_success_widget.dart';

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
