// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

import 'package:sajilo_yatra/ui_helper.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String? grade;
  String? product;
  var num = 1;
  String? thickness;
  String? price;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0062DE),
        centerTitle: true,
        title: const Text('Menu',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'ComicNeue',
              fontSize: 24,
              fontWeight: FontWeight.w900,
            )),
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: UiHelper.displayHeight(context) * 0.019,
              color: const Color(0xFFEFEEF3),
            ),
            ListTile(
                leading: Icon(
                  Icons.edit_document,
                  color: const Color(0xFF0062DE),
                  size: UiHelper.displayWidth(context) * 0.07,
                ),
                title: Text('Write Feedback',
                    style: TextStyle(
                        color: const Color(0xFF222222),
                        fontFamily: "NotoSans",
                        fontSize: UiHelper.displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w400)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: const Color(0xFFD6D6D6),
                  size: UiHelper.displayWidth(context) * 0.08,
                ),
                onTap: (() {
                  Navigator.pushNamed(context, '/ninetenth');
                })),
            UiHelper.verticalSpace(vspace: Spacing.xxsmall),
            Container(
              height: UiHelper.displayHeight(context) * 0.0015,
              color: const Color(0xFFD6D6D6),
            ),
            ListTile(
                leading: Icon(
                  Icons.help_outline_rounded,
                  color: const Color(0xFF0062DE),
                  size: UiHelper.displayWidth(context) * 0.07,
                ),
                title: Text('FAQs',
                    style: TextStyle(
                        color: const Color(0xFF222222),
                        fontFamily: "NotoSans",
                        fontSize: UiHelper.displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w400)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: const Color(0xFFD6D6D6),
                  size: UiHelper.displayWidth(context) * 0.08,
                ),
                onTap: (() {
                  Navigator.pushNamed(context, '/nineth');
                })),
            UiHelper.verticalSpace(vspace: Spacing.xxsmall),
            Container(
              height: UiHelper.displayHeight(context) * 0.0015,
              color: const Color(0xFFD6D6D6),
            ),
            ListTile(
                leading: Icon(
                  Icons.info_outline_rounded,
                  color: const Color(0xFF0062DE),
                  size: UiHelper.displayWidth(context) * 0.07,
                ),
                title: Text('About Us',
                    style: TextStyle(
                        color: const Color(0xFF222222),
                        fontFamily: "NotoSans",
                        fontSize: UiHelper.displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w400)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: const Color(0xFFD6D6D6),
                  size: UiHelper.displayWidth(context) * 0.08,
                ),
                onTap: (() {
                  Navigator.pushNamed(context, '/eighth');
                })),
            UiHelper.verticalSpace(vspace: Spacing.xxsmall),
            Container(
              height: UiHelper.displayHeight(context) * 0.0015,
              color: const Color(0xFFD6D6D6),
            ),
            ListTile(
                leading: Icon(
                  Icons.phone,
                  color: const Color(0xFF0062DE),
                  size: UiHelper.displayWidth(context) * 0.07,
                ),
                title: Text('Contact Us',
                    style: TextStyle(
                        color: const Color(0xFF222222),
                        fontFamily: "NotoSans",
                        fontSize: UiHelper.displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w400)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: const Color(0xFFD6D6D6),
                  size: UiHelper.displayWidth(context) * 0.08,
                ),
                onTap: (() {
                  Navigator.pushNamed(context, '/eighth');
                })),
            UiHelper.verticalSpace(vspace: Spacing.xxsmall),
            Container(
              height: UiHelper.displayHeight(context) * 0.0015,
              color: const Color(0xFFD6D6D6),
            ),
            ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  color: const Color(0xFF0062DE),
                  size: UiHelper.displayWidth(context) * 0.07,
                ),
                title: Text('LogOut',
                    style: TextStyle(
                        color: const Color(0xFF222222),
                        fontFamily: "NotoSans",
                        fontSize: UiHelper.displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w400)),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: const Color(0xFFD6D6D6),
                  size: UiHelper.displayWidth(context) * 0.08,
                ),
                onTap: (() {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            backgroundColor: const Color(0xFF0062DE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            title:
                                const Text("Are you sure you want to logout?"),
                            titleTextStyle: TextStyle(
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Nunito",
                              fontSize: UiHelper.displayWidth(context) * 0.043,
                            ),
                            actions: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(bottom: 11),
                                child: Row(
                                  children: [
                                    UiHelper.horizontaSpace(
                                        hspace: Spacing.large),
                                    UiHelper.horizontaSpace(
                                        hspace: Spacing.large),
                                    UiHelper.horizontaSpace(
                                        hspace: Spacing.large),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFFFFFFF),
                                      ),
                                      child: Text("Yes",
                                          style: TextStyle(
                                            color: const Color(0xFF0062DE),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Cabin",
                                            fontSize:
                                                UiHelper.displayWidth(context) *
                                                    0.045,
                                          )),
                                      onPressed: () {
                                        // Perform logout here
                                        Navigator.pushNamed(context, '/second');
                                      },
                                    ),
                                    UiHelper.horizontaSpace(
                                        hspace: Spacing.xxlarge),
                                    UiHelper.horizontaSpace(
                                        hspace: Spacing.xlarge),
                                    UiHelper.horizontaSpace(
                                        hspace: Spacing.large),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFFFFFFF),
                                      ),
                                      child: Text("No",
                                          style: TextStyle(
                                            color: const Color(0xFF0062DE),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Cabin",
                                            fontSize:
                                                UiHelper.displayWidth(context) *
                                                    0.045,
                                          )),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ),
                              )
                            ]);
                      });
                })),
            UiHelper.verticalSpace(vspace: Spacing.xxsmall),
            Container(
              height: UiHelper.displayHeight(context) * 0.0015,
              color: const Color(0xFFD6D6D6),
            ),
          ],
        ),
      ),
    );
  }
}
