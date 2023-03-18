// ignore_for_file: unnecessary_new

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sajilo_yatra/rideone.dart';
import 'package:sajilo_yatra/ridetwo.dart';
import 'package:sajilo_yatra/ui_helper.dart';

class Ride extends StatefulWidget {
  const Ride({
    Key? key,
  }) : super(key: key);

  @override
  State<Ride> createState() => _RideState();
}

class _RideState extends State<Ride> {
  @override
  var vehicle = ['Bus', 'Jeep', 'MicroBus', 'Taxi', 'Others'];
  var vehicle1 = [];
  DateTime? dob;
  TextEditingController dobController = TextEditingController();
  DateTime? dob2;
  TextEditingController dobController2 = TextEditingController();
  String? drop;
  late TextEditingController _goingController;
  late TextEditingController _leavingController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _goingController.dispose();
    _leavingController.dispose();
    super.dispose();
  }

  TabBar get _tabBar => TabBar(
        labelPadding: const EdgeInsets.only(top: 2),
        labelStyle: TextStyle(
            fontSize: UiHelper.displayWidth(context) * 0.037,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0E0E0E)),
        labelColor: Color(0xFF0E0E0E),
        unselectedLabelColor: Color(0xFF4D4D4D),
        indicatorColor: Color(0xFF004BA4),
        tabs: [
          Tab(text: 'Outstation'),
          Tab(text: 'Local'),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xFFFFFFFF),
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/seventh');
                  },
                );
              },
            ),
            backgroundColor: Color(0xFF0062DE),
            centerTitle: true,
            title: const Text('Ride',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontFamily: 'ComicNeue',
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                )),
            bottom: PreferredSize(
              preferredSize: _tabBar.preferredSize,
              child: Material(
                color: Color(0xFFFFFFFF), //<-- SEE HERE
                child: _tabBar,
              ),
            ),
          ),
          body: TabBarView(children: [
            RideOne(),
            RideTwo(),
          ])),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xFF004BA4);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.21);
    path.quadraticBezierTo(
        size.width / 2, size.height / 9, size.width, size.height * 0.21);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
