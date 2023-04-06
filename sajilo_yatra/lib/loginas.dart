import 'package:flutter/material.dart';
import 'package:sajilo_yatra/ui_helper.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4E93E8),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 140),
            child: Image.asset(
              'images/logos.png',
              width: 270,
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 68.0,
            width: UiHelper.displayWidth(context) * 0.63,
            margin: const EdgeInsets.only(top: 65),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                    255, 118, 173, 240), //background color of button
                //border width and color

                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                "Login As User",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 0.64,
                    letterSpacing: 0.5,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                    fontSize: UiHelper.displayWidth(context) * 0.038),
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
              height: UiHelper.displayHeight(context) * 0.0053,
              color: Color(0xFFFFFFFF)),
          Container(
            height: 68.0,
            width: UiHelper.displayWidth(context) * 0.63,
            margin: const EdgeInsets.only(
              top: 20,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                    255, 118, 173, 240), //background color of button
                //border width and color

                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                "Login As Vehicle Owner",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 0.69,
                    letterSpacing: 0.5,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                    fontSize: UiHelper.displayWidth(context) * 0.038),
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
