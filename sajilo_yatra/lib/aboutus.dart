// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AboutUs extends StatefulWidget {
  final String? going;
  final String? leaving;
  final String? city;
  final int initialIndex;
  const AboutUs(
      {Key? key, this.going, this.leaving, this.city, this.initialIndex = 0})
      : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
  late TextEditingController _cityController;

  @override
  void initState() {
    super.initState();
    _goingController = TextEditingController(text: widget.going);
    _leavingController = TextEditingController(text: widget.leaving);
    _cityController = TextEditingController(text: widget.city);
  }

  @override
  void dispose() {
    _goingController.dispose();
    _leavingController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Get.toNamed('/third2');
              },
            );
          },
        ),
        backgroundColor: const Color(0xFF0062DE),
        title: Text('About Us',
            style: TextStyle(
              letterSpacing: 0.95,
              color: const Color(0xFFFFFFFF),
              fontFamily: 'ComicNeue',
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            )),
      ),
      body: Container(
        color: const Color(0xFFFFFFFF),
        child: Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 1,
                child: Image.asset(
                  "images/cover.png",
                  width: 480,
                  height: 160,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 0.5.h,
              ),
              const Text(
                "OUR MISSION",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 2.5,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF222222),
                    fontSize: 19),
              ),
              Text(
                "The mission of Sajilo Yatra is to simplify and \nenhance the travel experience for individuals \nby providing a user-friendly platform for booking \nbus and train tickets. Our aim is to make travel \nplanning easy and accessible for everyone, offering \na seamless solution where users can \neffortlessly search, compare, and book tickets \nfrom a wide range of travel companies across \nNorth America and Europe. \n\nWe prioritize user satisfaction and strive to deliver \na high-quality service that saves time, reduces \nhassle, and ensures a pleasant journey. \nTransparency, reliability, and security are important \nto us, and we work closely with our travel partners \nto provide accurate information, reliable services, \nand secure transactions. \n\nWe embrace innovation and continuously improve \nour services by leveraging \ntechnological advancements and \ndata-driven insights. Through regular updates \nand enhancements, we aim to stay ahead \nof customer needs and provide an exceptional \nuser experience. \n\nOur goal is to revolutionize the way people plan \nand book their bus and train travel, making it \nsimpler, more convenient, and enjoyable. We are \ndedicated to delivering excellence and becoming \nthe preferred platform for hassle-free travel \nbooking.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    height: 0.4.h,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF222222),
                    fontSize: 16.sp),
              ),
              Container(
                height: 1.6.h,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
