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
  final customPaint = const CustomPaint();
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
                child: SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                    color: Colors.white))),
        const SizedBox(height: 100),
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
                          BorderRadius.vertical(top: Radius.circular(20))),
                  context: context,
                  builder: (context) => frame2());
            },
            child: const Text("Frame 2",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
        const SizedBox(height: 100),
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
                          BorderRadius.vertical(top: Radius.circular(20))),
                  context: context,
                  builder: (context) => frame3());
            },
            child: const Text("Frame 3",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
        const SizedBox(height: 100),
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
                          BorderRadius.vertical(top: Radius.circular(20))),
                  context: context,
                  builder: (context) => frame12());
            },
            child: const Text("Frame 12",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
      ]),
    ))));
  }

  Widget priceRangeSheet() {
    return SizedBox(
        height: 800,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //#line
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 2,
                  width: 50,
                  color: Colors.black),
              const Divider(color: Colors.black)
            ],
          ),
          //#price range text
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(25),
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
                        const SizedBox(height: 100),
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
                                  inactiveColor: Colors.white,
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
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 2,
                width: 50,
                color: Colors.black,
              ),
              const Divider(color: Colors.black),
            ],
          ),
          //#checkBar List
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(25),
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

  ///saler page
  Widget frame2() {
    return Container(
      padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 30),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                /// Create addres text
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, size: 27),
                    ),
                    const SizedBox(width: 17),
                    const Text(
                      "Введите адрес",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ],
                ),
                const SizedBox(height: 60),

                ///Search
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.blueAccent, width: 1),
                        borderRadius: BorderRadius.circular(30)),
                    hintText: "Поиск",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.near_me_outlined,
                      size: 25,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                ///Location
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.location_on,
                          size: 35,
                        ),
                      ),
                      const Text(
                        "Выбрать текущее местоположения",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),

                ///Line
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  color: const Color(0xFFC4C4C4),
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      frame3();
                    },
                    child: const Text(
                      "Введите адрес вручную",
                      style: TextStyle(
                          color: Color(0xFF544AEB),
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ),

          ///Save button
          SizedBox(
            height: 55,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                child: const Text(
                  "Сохранить",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF4F4E9A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {}),
          )
        ],
      ),
    );
  }

  ///saler page
  Widget frame3() {
    return Container(
        padding:
            const EdgeInsets.only(bottom: 20, left: 27, right: 27, top: 30),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Create addres text
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, size: 27),
                ),
                const SizedBox(width: 17),
                const Text(
                  "Введите адрес",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ],
            ),
            const SizedBox(height: 60),

            ///Region
            TextField(
              cursorColor: const Color(0xFF4F4E9A),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Область",
                  labelStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: PopupMenuButton(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        child: Text("Tashkent"),
                        value: 1,
                      ),
                      const PopupMenuItem(
                        child: Text("Andijan"),
                        value: 2,
                      )
                    ],
                  )),
            ),
            const SizedBox(height: 15),

            ///District / City
            TextField(
              cursorColor: const Color(0xFF4F4E9A),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Район/Город",
                  labelStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: PopupMenuButton(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      itemBuilder: (context) => [
                            const PopupMenuItem(
                              child: Text("Tashkent"),
                              value: 1,
                            ),
                            const PopupMenuItem(
                              child: Text("Andijon"),
                              value: 2,
                            ),
                          ])),
            ),
            const SizedBox(height: 10),

            ///Street
            TextField(
              cursorColor: const Color(0xFF4F4E9A),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Улица",
                  labelStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: PopupMenuButton(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      itemBuilder: (context) => [
                            const PopupMenuItem(
                              child: Text("Tashkent"),
                              value: 1,
                            ),
                            const PopupMenuItem(
                              child: Text("Andijan"),
                              value: 2,
                            )
                          ])),
            ),
            const SizedBox(
              height: 40,
            ),

            ///line
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFFC4C4C4),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Точное место",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Вы можете покозать, где именно находится жилье.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),

            ///Map
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Map",
                style: TextStyle(fontSize: 30),
              ),
              height: 220,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(
              height: 25,
            ),

            ///Save button
            SizedBox(
              height: 55,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  child: const Text(
                    "Сохранить",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF4F4E9A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {}),
            )
          ],
        ));
  }

  ///saler page
  Widget frame12() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Есть ли у вас особые удобства ?",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(height: 20,),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 8,
              itemBuilder: (BuildContext context, index) {
                return gridContainer(Frame12.listFrame12[index]);
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){},
                    child: const Text("Назад",style: TextStyle(fontSize: 17),)),
                ElevatedButton(

                  onPressed: (){},
                  child: const Text("Далее"),
                  style: ElevatedButton.styleFrom(

                      primary: const Color(0xFF4F4E9A)
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }

  Container gridContainer(Frame12 elem) {
    return Container(
      margin: const EdgeInsets.all(8,),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            elem.item,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
          Image.asset(
            elem.image,
            height: 32,
            width: 32                                              ,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
