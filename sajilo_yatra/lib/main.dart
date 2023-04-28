import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sajilo_yatra/help.dart';
import 'package:sajilo_yatra/offers/offerone%20copy%202.dart';
import 'package:sajilo_yatra/offers/offerone%20copy%203.dart';
import 'package:sajilo_yatra/offers/offerone%20copy%204.dart';
import 'package:sajilo_yatra/offers/offerone%20copy%205.dart';
import 'package:sajilo_yatra/offers/offerone%20copy.dart';
import 'package:sajilo_yatra/offers/offerone.dart';
import 'package:sajilo_yatra/outstationgoing.dart';
import 'package:sajilo_yatra/outstationleaving.dart';
import 'package:get/get.dart';
import 'package:sajilo_yatra/payment.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import 'package:sajilo_yatra/profile.dart';
import 'package:sajilo_yatra/ride.dart';
import 'package:sajilo_yatra/ridesearch.dart';
import 'package:sajilo_yatra/search.dart';

import 'package:sajilo_yatra/tickets.dart';
import 'package:sajilo_yatra/userdetails.dart';

import 'package:sajilo_yatra/userhome.dart';
import 'package:sajilo_yatra/userregister.dart';
import 'package:sajilo_yatra/vehcileprofile.dart';
import 'package:sajilo_yatra/vehiclegoing.dart';
import 'package:sajilo_yatra/vehicleleaving.dart';
import 'package:sajilo_yatra/vehiclemenu.dart';
import 'package:sajilo_yatra/vehicleownerforgotpassword.dart';
import 'package:sajilo_yatra/vehicleownerhome.dart';
import 'package:sajilo_yatra/vehicleownerlogin.dart';
import 'package:sajilo_yatra/vehicleownerregister.dart';
import 'package:sajilo_yatra/vehicletickets.dart';
import 'package:sajilo_yatra/vhelp.dart';
import 'bookings.dart';
import 'city.dart';
import 'editprofile.dart';
import 'feedbacks.dart';
import 'forgotpassword.dart';
import 'going.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'homepage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'leaving.dart';

import 'menu.dart';
import 'userlogin.dart';
import 'loginas.dart';
import 'splashscreen.dart';

late SharedPreferences sharedPreferences;

Future<void> main() async {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController1 = TextEditingController();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  sharedPreferences = await SharedPreferences.getInstance();
  await dotenv.load(fileName: ".env");

  runApp(KhaltiScope(
      publicKey: "test_public_key_51ce9cb3f72743fe899ec90e5e72690b",
      enabledDebugging: true,
      builder: (context, navKey) {
        return Theme(
            data: ThemeData(
              useMaterial3: true,
            ),
            child: ResponsiveSizer(
              builder: (context, orientation, screenType) {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  // Start the app with the "/" named route. In this case, the app starts
                  // on the FirstScreen widget.
                  initialRoute: '/',
                  getPages: [
                    GetPage(
                      name: '/',
                      page: () => const MyHomePage(),
                      transitionDuration: const Duration(milliseconds: 600),
                      transition: Transition.cupertino,
                    ),
                    GetPage(
                      name: '/second',
                      page: () => const FirstScreen(),
                      transitionDuration: const Duration(milliseconds: 600),
                      transition: Transition.cupertino,
                    ),
                    GetPage(
                      name: '/third3',
                      page: () => const UsersScreen(),
                      transitionDuration: const Duration(milliseconds: 600),
                      transition: Transition.cupertinoDialog,
                    ),
                    GetPage(
                      name: '/third2',
                      page: () => const HomePage(),
                      transitionDuration: const Duration(milliseconds: 600),
                      transition: Transition.fadeIn,
                    ),
                    GetPage(
                      name: '/third4',
                      page: () => const OfferTwo(),
                      transitionDuration: const Duration(milliseconds: 600),
                      transition: Transition.fadeIn,
                    ),
                    GetPage(
                      name: '/third5',
                      page: () => const OfferOne(),
                      transitionDuration: const Duration(milliseconds: 600),
                      transition: Transition.fadeIn,
                    ),
                    GetPage(
                      name: '/third6',
                      page: () => const OfferThree(),
                      transitionDuration: const Duration(milliseconds: 600),
                      transition: Transition.fadeIn,
                    ),
                    GetPage(
                      name: '/third7',
                      page: () => const OfferFour(),
                      transitionDuration: const Duration(milliseconds: 600),
                      transition: Transition.fadeIn,
                    ),
                    GetPage(
                      name: '/third8',
                      page: () => const OfferFive(),
                      transitionDuration: const Duration(milliseconds: 600),
                      transition: Transition.fadeIn,
                    ),
                    GetPage(
                      name: '/third9',
                      page: () => const OfferSix(),
                      transitionDuration: const Duration(milliseconds: 600),
                      transition: Transition.fadeIn,
                    ),
                    GetPage(
                      name: '/tenth',
                      page: () => const EighthScreen(),
                      transitionDuration: const Duration(milliseconds: 600),
                      transition: Transition.fadeIn,
                    ),
                  ],
                  routes: {
                    // When navigating to the "/" route, build the FirstScreen widget.

                    '/third': (context) => const FifthScreen(),
                    '/fourth': (context) => const FifthRoute(),
                    '/fifth': (context) => const SixthScreen(),
                    '/sixth': (context) => const SixthRoute(),
                    '/seventh': (context) => const ThirdRoute(
                          userId: '',
                        ),
                    '/eighth': (context) => const EighthRoute(),
                    '/nineth': (context) => const NinethScreen(),

                    '/eleventh': (context) => const NinethRoute(),
                    '/tweleventh': (context) => const TenthScreen(),

                    '/fourteenth': (context) => const FourthRoute(
                          userId: '',
                        ),
                    '/fifteenth': (context) => ForgotPasswordScreen(),

                    '/seventeenth': (context) => const Menu(),
                    '/eighteenth': (context) => const Ride(),
                    '/ninetenth': (context) => const FeedbacksScreen(),
                    '/twenty': (context) => const SearchScreen(),

                    '/line2': (context) => const Payment(
                          userId: '',
                        ),
                    '/line3': (context) => const OutStation(),
                    '/line4': (context) => const OutRoute(),
                    '/line5': (context) => const City(),
                    '/line6': (context) => PasswordScreen(),
                    '/line7': (context) => const VehicleHome(
                          userId: '',
                          going: '',
                          leaving: '',
                        ),
                    '/line8': (context) => const VehicleLeaving(),
                    '/line9': (context) => const VehicleGoing(),
                    '/line10': (context) => const VehicleTickets(),
                    '/line11': (context) => const Edit(
                          userId: '',
                        ),
                    '/line12': (context) => const OutSearchScreen(),
                    '/line13': (context) => const Profile(
                          userId: '',
                        ),
                    '/line14': ((context) => const VMenu()),
                    '/line15': ((context) => const VHelp())
                  },
                  navigatorKey: navKey,
                  localizationsDelegates: const [
                    KhaltiLocalizations.delegate,
                  ],
                );
              },
              maxTabletWidth: 900, // Optional),
            ));
      }));
}
