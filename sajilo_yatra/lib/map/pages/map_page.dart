import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../location/bloc/location_bloc.dart';
import '../../location_repository.dart';
import 'map_layout.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LocationRepository(),
      child: BlocProvider<LocationBloc>(
        create: (context) => LocationBloc(
          locationRepository: context.read<LocationRepository>(),
        )..add(GetLocation()),
        child: const MapLayout(),
      ),
    );
  }
}
