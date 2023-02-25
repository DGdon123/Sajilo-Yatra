import 'package:flutter/material.dart';
import 'package:sajilo_yatra/ui_helper.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4E93E8),
      body: Column(
        children: [
          Container(
            height: 70.0,
            width: 250.2,
            margin: const EdgeInsets.only(
              top: 300,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF9BC2F2), //background color of button
                //border width and color

                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text(
                "Login As User",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 0.64,
                    letterSpacing: 0.5,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                    fontSize: 17),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
          ),
          Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              width: UiHelper.displayWidth(context) * 1,
              height: UiHelper.displayHeight(context) * 0.0035,
              color: Color(0xFFFFFFFF)),
          Container(
            height: 70.0,
            width: 250.2,
            margin: const EdgeInsets.only(
              top: 20,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF9BC2F2), //background color of button
                //border width and color

                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text(
                "Login As Vehicle Owner",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 0.64,
                    letterSpacing: 0.5,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                    fontSize: 17),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/fourth');
              },
            ),
          ),
        ],
      ),
    );
  }
}
