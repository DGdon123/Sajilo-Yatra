import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:google_maps_flutter_platform_interface/src/types/location.dart'
    as maps;
import 'package:mapbox_gl_platform_interface/mapbox_gl_platform_interface.dart'
    as mapbox;

import '../location_repository.dart';
import '../models/current_location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc({
    required this.locationRepository,
  }) : super(LocationState()) {
    on<GetLocation>(_getLocationEvent);
  }
  final LocationRepository locationRepository;

  void _getLocationEvent(GetLocation event, Emitter<LocationState> emit) async {
    try {
      emit(state.copyWith(status: LocationStateStatus.loading));

      var _currentLocation = await locationRepository.getCurrentLocation();

      emit(
        state.copyWith(
          currentUserLocation: _currentLocation,
          status: LocationStateStatus.success,
        ),
      );
    } on CurrentLocationFailure catch (e) {
      emit(
        state.copyWith(
          status: LocationStateStatus.error,
          errorMessage: e.error,
        ),
      );
      // This is important to check errors on tests.
      // Also you can see the error on the [BlocObserver.onError].
      addError(e);
    }
  }
}
