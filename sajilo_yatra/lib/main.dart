import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sajilo_yatra/contactus.dart';
import 'package:sajilo_yatra/help.dart';
import 'package:sajilo_yatra/home.dart';
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

import 'package:sajilo_yatra/profile.dart';
import 'package:sajilo_yatra/ride.dart';
import 'package:sajilo_yatra/ridesearch.dart';
import 'package:sajilo_yatra/search.dart';

import 'package:sajilo_yatra/tickets.dart';
import 'package:sajilo_yatra/useraboutus.dart';
import 'package:sajilo_yatra/userdetails.dart';
import 'package:flutter/services.dart';

import 'package:sajilo_yatra/userhome.dart';
import 'package:sajilo_yatra/userregister.dart';
import 'package:sajilo_yatra/vehcileprofile.dart';
import 'package:sajilo_yatra/vehicle_editprofile.dart';
import 'package:sajilo_yatra/vehiclegoing.dart';
import 'package:sajilo_yatra/vehicleleaving.dart';
import 'package:sajilo_yatra/vehiclemenu.dart';
import 'package:sajilo_yatra/vehicleownerforgotpassword.dart';
import 'package:sajilo_yatra/vehicleownerhome.dart';
import 'package:sajilo_yatra/vehicleownerlogin.dart';
import 'package:sajilo_yatra/vehicleownerregister.dart';
import 'package:sajilo_yatra/vehicletickets.dart';
import 'package:sajilo_yatra/vhelp.dart';
import 'aboutus.dart';
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
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Firebase.initializeApp();
  sharedPreferences = await SharedPreferences.getInstance();
  await dotenv.load(fileName: ".env");

  runApp(Theme(
      data: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
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
                transition: Transition.fade,
              ),
              GetPage(
                name: '/third4',
                page: () => const OfferTwo(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/third5',
                page: () => const OfferOne(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/third6',
                page: () => const OfferThree(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/third7',
                page: () => const OfferFour(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/third8',
                page: () => const OfferFive(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/third9',
                page: () => const OfferSix(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/tenth',
                page: () => const EighthScreen(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/seventh',
                page: () => const ThirdRoute(
                  userId: '',
                ),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.fade,
              ),
              GetPage(
                name: '/hun1',
                page: () => const Home(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/eighth',
                page: () => const Home(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/line20',
                page: () => const VEdit(
                  userId: '',
                ),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/line21',
                page: () => const AboutUs(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/line22',
                page: () => const UAboutUs(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/line23',
                page: () => const Contact(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/line24',
                page: () => const NinethScreen(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/third',
                page: () => const FifthScreen(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/third',
                page: () => const FifthScreen(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
              GetPage(
                name: '/fourth',
                page: () => const FifthRoute(),
                transitionDuration: const Duration(milliseconds: 600),
                transition: Transition.cupertino,
              ),
            ],
            routes: {
              // When navigating to the "/" route, build the FirstScreen widget.

              '/fifth': (context) => const SixthScreen(),
              '/sixth': (context) => const SixthRoute(),

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
          );
        },
        maxTabletWidth: 900, // Optional),
      )));
}
