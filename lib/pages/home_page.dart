import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:part_of_picco_project/model/facility_model.dart';

import 'bottom_sheet/widgets/custom_paint.dart';
import 'bottom_sheet/widgets/item_checked_box.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final customPaint = CustomPaint();
  List<Facility> listFacility = [
    Facility(name: 'Wi-Fi'),
    Facility(name: 'Kitchen'),
    Facility(name: 'Air Conditioning'),
    Facility(name: 'Washing Machine'),
    Facility(name: 'Iron')
  ];

  bool checkBoxValue = false;
  static const double _minVal = 1.0;
  static const double _maxVal = 100.0;
  RangeValues values = const RangeValues(_minVal, _maxVal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
          //facilities bottom sheet
          MaterialButton(
              height: 50,
              minWidth: 200,
              shape: const StadiumBorder(),
              color: Colors.blueAccent.shade700,
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10))),
                    context: context,
                    builder: (context) => priceRangeSheet());
              },
              child: const Text("Price Range",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
          const SizedBox(
            height: 100,
          ),
          //price range bottom sheet
          MaterialButton(
              height: 50,
              minWidth: 200,
              shape: const StadiumBorder(),
              color: Colors.blueAccent.shade700,
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(5))),
                    context: context,
                    builder: (context) => facilitiesSheet());
              },
              child: const Text("Facilities",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)))
        ]))));
  }

  Widget priceRangeSheet() {
    return Container(
        height: 800,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //#line
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 2,
                  width: 50,
                  color: Colors.black),
              Divider(color: Colors.black)
            ],
          ),
          //#price range text
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Price Range",
                            style: TextStyle(
                                color: Color(0xFF4F4E9A),
                                fontSize: 25,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 17),
                        //#price number
                        const Text("\$50 - \$10 200",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xFF010047))),
                        const SizedBox(height: 15),
                        //#average price
                        Row(children: const [
                          Text("Average Price: \$1 200",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400))
                        ]),
                        SizedBox(height: 100),
                        Stack(
                          children: [
                            SizedBox(
                              height: 1,
                              width: 233,
                              child: CustomPaint(
                                painter: CSS(),
                              ),
                            ),
                            StatefulBuilder(
                              builder: (context, setState) => RangeSlider(
                                  activeColor: Colors.white,
                                  inactiveColor:Colors.white,
                                  divisions: 40,
                                  min: _minVal,
                                  max: _maxVal,
                                  onChanged: (value) {
                                    setState(() {
                                      if (kDebugMode) {
                                        print(value);
                                      }
                                      values = value;
                                    });
                                  },
                                  values: values),
                            ),
                          ],
                        ),
                      ]))),

          //slider
          const Divider(color: Colors.black),
          //clear all and done buttons
          Container(
              padding: const EdgeInsets.only(
                  left: 40, right: 40, top: 10, bottom: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text("Clear all",
                            style:
                                TextStyle(color: Colors.black, fontSize: 12))),
                    MaterialButton(
                        onPressed: () {},
                        color: const Color(0xFF4F4E9A),
                        minWidth: 107,
                        height: 47,
                        child: const Text("Done",
                            style: TextStyle(color: Colors.white)))
                  ]))
        ]));
  }

  Widget facilitiesSheet() {
    return SizedBox(
        height: 800,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 2,
                width: 50,
                color: Colors.black,
              ),
              Divider(color: Colors.black),
            ],
          ),
          //#checkBar List
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(25),
                  child: ListView(children: [
                    const Text(
                      "Facilities",
                      style: TextStyle(
                          color: Color(
                            0xFF4F4E9A,
                          ),
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: listFacility.length,
                        itemBuilder: (context, index) {
                          return ItemsList(facility: listFacility[index]);
                        })
                  ]))),
          const Divider(color: Colors.black),
          //# Clear All & Done
          Container(
              padding: const EdgeInsets.only(
                  left: 40, right: 40, top: 10, bottom: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Clear all",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        )),
                    MaterialButton(
                        onPressed: () {},
                        color: const Color(0xFF4F4E9A),
                        minWidth: 107,
                        height: 47,
                        child: const Text(
                          "Done",
                          style: TextStyle(color: Colors.white),
                        ))
                  ]))
        ]));
  }
}
