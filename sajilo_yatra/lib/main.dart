import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sajilo_yatra/help.dart';
import 'package:sajilo_yatra/map/pages/map_page.dart';
import 'package:sajilo_yatra/profile.dart';

import 'package:sajilo_yatra/tickets.dart';

import 'package:sajilo_yatra/userhome.dart';
import 'package:sajilo_yatra/userregister.dart';
import 'package:sajilo_yatra/vehicleownerlogin.dart';
import 'package:sajilo_yatra/vehicleownerregister.dart';
import 'bookings.dart';
import 'going.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'leaving.dart';

import 'map/pages/map_layout.dart';
import 'map/widgets/map_success_widget.dart';
import 'userlogin.dart';
import 'loginas.dart';
import 'splashscreen.dart';

late SharedPreferences sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  sharedPreferences = await SharedPreferences.getInstance();
  await dotenv.load(fileName: "assets/config/.env");

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => const MyHomePage(),
      '/second': (context) => const FirstScreen(),
      '/third': (context) => const FifthScreen(),
      '/fourth': (context) => const FifthRoute(),
      '/fifth': (context) => const SixthScreen(),
      '/sixth': (context) => const SixthRoute(),
      '/seventh': (context) => ThirdRoute(
            userId: '',
          ),
      '/eighth': (context) => const EighthRoute(),
      '/nineth': (context) => const NinethScreen(),
      '/tenth': (context) => const EighthScreen(),
      '/eleventh': (context) => const NinethRoute(),
      '/tweleventh': (context) => const TenthScreen(),
      '/thirteenth': (context) => const MapPage(),
      '/fourteenth': (context) => const FourthRoute(
            userId: '',
          ),
    },
  ));
}
