// ignore_for_file: unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:sajilo_yatra/ui_helper.dart';

class EighthRoute extends StatefulWidget {
  const EighthRoute({
    Key? key,
  }) : super(key: key);

  @override
  State<EighthRoute> createState() => _EighthRouteState();
}

class _EighthRouteState extends State<EighthRoute> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController dobController3 = TextEditingController();
  TextEditingController dobController2 = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController timeController2 = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final _loading = false;

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _deleteItem(String documentId) async {
    setState(() {
      isLoading = true;
    });

    FirebaseFirestore.instance
        .collection('bookings')
        .doc(documentId)
        .delete()
        .then((value) {
      print('Document deleted successfully');
      setState(() {
        isLoading = false;
      });
    }).catchError((error) {
      print('Error deleting document: $error');
      setState(() {
        isLoading = false;
      });
    });
  }

  final fireStore =
      FirebaseFirestore.instance.collection('bookings').snapshots();

  final _storage = const FlutterSecureStorage();
  final FirebaseFirestore db = FirebaseFirestore.instance;

  var num = 1;
  late CollectionReference ticketsRef;
  late Stream<QuerySnapshot> fireStores;

  String username = "";
  String pathPDF = "";
  DateTime? dob2;
  String vehiclename = "";
  String locat = "";
  String emailing = "";
  String phonenumber = "";
  String gen = "";
  String aging = "";

  String dobing = "";
  String seats = "";
  String vehiclefacility = "";
  String arrival1 = "";
  String arrive1 = "";
  String date1 = "";
  String depart1 = "";
  String departure1 = "";
  String price1 = "";
  String seats1 = "";
  List<Map<String, dynamic>> _dataList = [];

  var isLoading = true;

  Future<void> _savedData1() async {
    final snapshot = await db.collection("bookings").get();

    final vehicleOwners = snapshot.docs.map((doc) => doc.data()).toList();

    if (vehicleOwners.isNotEmpty) {
      // check if there is at least one document in the snapshot
      final data = vehicleOwners.first;
      final date = data['date'];

      await _storage.write(key: 'date', value: date);

      setState(() {
        arrival1 = date;

        isLoading = false;
      });
    } else {
      print('No documents found for the user');
    }
  }

  Future<List<Map<String, dynamic>>> _savedData() async {
    final vehName = await _storage.read(key: 'vehicle_name');
    print(vehName);

    final snapshot = await db.collection("bookings").get();
    final users = snapshot.docs.map((doc) => doc.data()).toList();

    final dataList = users.map((data) {
      final arrival = data['arrival'];
      final arrive = data['arrive'];
      final date = data['date'];
      final depart = data['depart'];
      final departure = data['departure'];
      final price = data['price'];
      final seats = data['seats'];
      final facility = data['vehicle_facility'];
      final name = data['vehicle_name'];

      return {
        'arrival': arrival,
        'arrive': arrive,
        'date': date,
        'depart': depart,
        'departure': departure,
        'price': price,
        'seats': seats,
        'vehicle_facility': facility,
        'vehicle_name': name
      };
    }).toList();

    return dataList;
  }

  Future<void> _getDataList() async {
    try {
      final dataList = await _savedData();
      setState(() {
        _dataList = dataList;
      });
    } catch (e) {
      print('Error retrieving data: $e');
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _savedData();
    _getDataList();
    _savedData1();
    dobController3 = TextEditingController(text: date1);
    print(dobController3);
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF0062DE),
          centerTitle: true,
          title: const Text('Bookings',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: 'ComicNeue',
                fontSize: 24,
                fontWeight: FontWeight.w900,
              )),
          elevation: 0,
        ),
        body: Center(
          child: isLoading
              ? FutureBuilder(
                  future: Future.delayed(const Duration(seconds: 3)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        child: LoadingAnimationWidget.hexagonDots(
                          size: UiHelper.displayWidth(context) * 0.08,
                          color: const Color(0xFF0062DE),
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      heightFactor: 0.6,
                                      child: Container(
                                        width: 395,
                                        height: 70,
                                        color: const Color(0xFFFFFFFF),
                                        child: const Text(
                                          "You have no bookings yet.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xFF0062DE),
                                              fontSize: 19.5,
                                              fontFamily: "Cambay",
                                              fontWeight: FontWeight.w900,
                                              height: 3.85),
                                        ),
                                      ),
                                    ),
                                    const Align(
                                      alignment: Alignment.bottomCenter,
                                      heightFactor: 1.8,
                                      widthFactor: 4.4,
                                      child: Icon(
                                        Icons.event_busy_rounded,
                                        size: 170,
                                        color: Color(0xFF222222),
                                      ),
                                    ),
                                    Container(
                                      height: 34.4,
                                      width: 140,
                                      margin:
                                          const EdgeInsets.only(bottom: 185),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF222222),

                                          shape: RoundedRectangleBorder(
                                              //to set border radius to button
                                              borderRadius: BorderRadius.circular(
                                                  12)), //background color of button
                                        ),
                                        child: const Text(
                                          "Book Now",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              height: 1.2,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 16),
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/tenth');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  })
              : (_dataList.isNotEmpty) // check if ring list is empty
// check if ring list is empty
                  ? Column(children: [
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                                  child: Column(children: [
                        Container(
                          color: const Color(0xFF0062DE),
                          height: UiHelper.displayHeight(context) * 0.115,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 15),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: dobController3,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 49, 121, 215),
                                        prefixIcon: Icon(
                                          Icons.calendar_month_rounded,
                                          size: UiHelper.displayWidth(context) *
                                              0.075,
                                          color: const Color(0xFFFFFFFF),
                                        ),
                                        hintText: arrival1,
                                        hintStyle: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Mulish",
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFFFFFFFF)),
                                        suffixIcon: Icon(
                                          Icons.arrow_drop_down_rounded,
                                          size: UiHelper.displayWidth(context) *
                                              0.1,
                                          color: const Color(0xFFFFFFFF),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 49, 121, 215),
                                              width: 0,
                                              style: BorderStyle.solid),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 49, 121, 215),
                                              width: 0,
                                              style: BorderStyle.solid),
                                        ),
                                        prefixIconColor: const Color.fromARGB(
                                            255, 255, 0, 0),
                                      ),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: "Mulish",
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFFFFFFF)),
                                      onTap: () async {
                                        FocusScope.of(context)
                                            .requestFocus(new FocusNode());
                                        final DateTime? date =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2100),
                                        );
                                        if (date != null) {
                                          dobController3.text =
                                              DateFormat("yyyy-MM-dd")
                                                  .format(date);
                                          dob2 = date;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: UiHelper.displayHeight(context) * 0.779,
                            child: Container(
                              color: const Color(0xFF9BC2F2),
                              margin: const EdgeInsets.only(bottom: 62),
                              child: ListView.builder(
                                itemCount: _dataList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final data = _dataList[index];

                                  final arrival = data['arrival'];
                                  final arrive = data['arrive'];
                                  final depart = data['depart'];
                                  final departure = data['departure'];
                                  final price = data['price'];
                                  final facility = data['vehicle_facility'];

                                  final seats = data['seats'];
                                  final vehicle = data['vehicle_name'];

                                  print(vehicle);
                                  print(arrival);
                                  print(arrive);

                                  print(depart);
                                  print(departure);
                                  print(price);
                                  print(facility);
                                  print(seats);

                                  return ListTile(
                                    title: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 1.8.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 1.19.w,
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                bottom: 8,
                                              ),
                                              child: Text(
                                                "${departure.split(',')[0].trim().toUpperCase()} TO ${arrival.split(',')[0].trim().toUpperCase()}",
                                                style: TextStyle(
                                                  fontFamily: "PublicSans",
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  fontSize:
                                                      UiHelper.displayWidth(
                                                              context) *
                                                          0.035,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 4),
                                          child: Text(
                                            vehicle,
                                            style: TextStyle(
                                              fontFamily: "PublicSans",
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFFFFFFFF),
                                              fontSize: UiHelper.displayWidth(
                                                      context) *
                                                  0.047,
                                            ),
                                          ),
                                        ),
                                        UiHelper.verticalSpace(
                                            vspace: Spacing.small),
                                        UiHelper.verticalSpace(
                                            vspace: Spacing.small),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 4),
                                          child: Text(
                                            facility,
                                            style: TextStyle(
                                              fontFamily: "PublicSans",
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF222222),
                                              fontSize: UiHelper.displayWidth(
                                                      context) *
                                                  0.038,
                                            ),
                                          ),
                                        ),
                                        UiHelper.verticalSpace(
                                            vspace: Spacing.medium),
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 4),
                                              child: Text(
                                                depart,
                                                style: TextStyle(
                                                  fontFamily: "PublicSans",
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFF222222),
                                                  fontSize:
                                                      UiHelper.displayWidth(
                                                              context) *
                                                          0.036,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 8, bottom: 2),
                                              height: UiHelper.displayHeight(
                                                      context) *
                                                  0.01,
                                              width: UiHelper.displayWidth(
                                                      context) *
                                                  0.02,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFF222222),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(70))),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                left: 0,
                                                bottom: 2,
                                              ),
                                              height: UiHelper.displayHeight(
                                                      context) *
                                                  0.0035,
                                              width: UiHelper.displayWidth(
                                                      context) *
                                                  0.07,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFF222222),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(00))),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                left: 0,
                                                bottom: 2,
                                              ),
                                              height: UiHelper.displayHeight(
                                                      context) *
                                                  0.0035,
                                              width: UiHelper.displayWidth(
                                                      context) *
                                                  0.07,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFF222222),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(00))),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 2),
                                              height: UiHelper.displayHeight(
                                                      context) *
                                                  0.01,
                                              width: UiHelper.displayWidth(
                                                      context) *
                                                  0.02,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFF222222),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(70))),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 8),
                                              child: Text(
                                                arrive,
                                                style: TextStyle(
                                                  fontFamily: "PublicSans",
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFF222222),
                                                  fontSize:
                                                      UiHelper.displayWidth(
                                                              context) *
                                                          0.036,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 14, left: 4),
                                          height:
                                              UiHelper.displayHeight(context) *
                                                  0.0007,
                                          width:
                                              UiHelper.displayWidth(context) *
                                                  0.9,
                                          decoration: const BoxDecoration(
                                              color: Color(0xFF222222),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(00))),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 15),
                                              height: UiHelper.displayHeight(
                                                      context) *
                                                  0.045,
                                              width: UiHelper.displayWidth(
                                                      context) *
                                                  0.245,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFF222222),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6))),
                                              child: Row(
                                                children: [
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.small),
                                                  Icon(
                                                    Icons.event_seat_rounded,
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    size: UiHelper.displayWidth(
                                                            context) *
                                                        0.05,
                                                  ),
                                                  UiHelper.horizontaSpace(
                                                      hspace: Spacing.small),
                                                  Text(
                                                    "${seats.toString()} Seats",
                                                    style: TextStyle(
                                                      fontFamily: "PublicSans",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                      fontSize:
                                                          UiHelper.displayWidth(
                                                                  context) *
                                                              0.034,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 51.w),
                                            Container(
                                                child: Text(
                                              "Rs: ${price.toString()}",
                                              style: TextStyle(
                                                fontFamily: "PublicSans",
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF222222),
                                                fontSize: UiHelper.displayWidth(
                                                        context) *
                                                    0.043,
                                              ),
                                            )),
                                          ],
                                        ),
                                        SizedBox(height: 2.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              height: 5.h,
                                              width: 25.w,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: const Color(
                                                        0xFF0062DE), //background color of button
                                                    //border width and color

                                                    shape:
                                                        RoundedRectangleBorder(
                                                            //to set border radius to button
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3)),
                                                  ),
                                                  child: Text("PDF",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.ptSans()),
                                                  onPressed: () {
                                                    createPdf();
                                                  }),
                                            ),
                                            SizedBox(width: 4.w),
                                            SizedBox(
                                                height: 5.h,
                                                width: 25.w,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.red,
                                                    //background color of button
                                                    //border width and color

                                                    shape:
                                                        RoundedRectangleBorder(
                                                            //to set border radius to button
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3)),
                                                  ),
                                                  child: Text("Delete",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.ptSans()),
                                                  onPressed: () {
                                                    FirebaseFirestore.instance
                                                        .collection('bookings')
                                                        .where('id',
                                                            isEqualTo:
                                                                data['id'])
                                                        .get()
                                                        .then((QuerySnapshot
                                                            snapshot) {
                                                      if (snapshot
                                                          .docs.isNotEmpty) {
                                                        _deleteItem(snapshot
                                                            .docs[0].id);
                                                      }
                                                    }).catchError((error) {
                                                      print(
                                                          'Error fetching document: $error');
                                                    });
                                                  },
                                                )),
                                          ],
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 18,
                                          ),
                                          height:
                                              UiHelper.displayHeight(context) *
                                                  0.0015,
                                          width:
                                              UiHelper.displayWidth(context) *
                                                  1,
                                          decoration: const BoxDecoration(
                                              color: Color(0xFF222222),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(00))),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ))
                      ]))))
                    ])
                  : Container(
                      child: LoadingAnimationWidget.hexagonDots(
                      size: UiHelper.displayWidth(context) * 0.08,
                      color: const Color(0xFF0062DE),
                    )),
        ));
  }

  Future<void> createPdf() async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (context) => pw.Center(
        child: pw.Text('Hello World!', style: const pw.TextStyle(fontSize: 48)),
      ),
    ));

    final output = await getExternalStorageDirectory();
    final file = File('${output!.path}/example.pdf');
    await file.writeAsBytes(await pdf.save());

    print('PDF saved to ${file.path}');

    // Open the saved PDF file
    await OpenFile.open(file.path);
  }
}
