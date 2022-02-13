import 'dart:convert';

import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';

import 'package:fixhome2/screens/example.dart';
import 'package:fixhome2/screens/home.dart';
import 'package:fixhome2/screens/services_provider.dart';

import 'package:fixhome2/screens/viewmp.dart';
import 'package:fixhome2/sharedwidget/splist.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class Body1 extends StatefulWidget {
  const Body1({Key key}) : super(key: key);

  @override
  _Body1State createState() => _Body1State();
}

class _Body1State extends State<Body1> {
  List users = [];
  String pid = "";
  int id;
  String painter = "";
  String painter1 = "";
  String cid = "";
  String cleaning = "";
  String cleaning1 = "";
  String caid = "";
  String carpenter = "";
  String carpenter1 = "";
  String eid = "";
  String electric = "";
  String electric1 = "";
  String iid = "";
  String interior = "";
  String interior1 = "";
  String carid = "";
  String car = "";
  String car1 = "";
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getApiData();
    this.getPaintApi();
    this.getCleanApi();
    this.getCarApi();
    this.getCarpainterApi();
    this.getElectricApi();
    this.getInteriorApi();
  }

  getApiData() async {
    var url = Uri.parse('https://bcsportal.com.pk/test/fetchimage.php');
    http.Response respons = await http.get(url);
    print(respons.statusCode);
    if (respons.statusCode == 200) {
      print("success");
      final data = jsonDecode(respons.body);
      print(data);
      final text = data[0]['pic'];
      print(text);
      setState(() {
        users = data;
        print(users);
      });
    } else {
      print("something wrong");
    }
  }

  getPaintApi() async {
    var url = Uri.parse('https://bcsportal.com.pk/test/painter.php');
    http.Response respons = await http.get(url);
    print(respons.statusCode);
    if (respons.statusCode == 200) {
      print("success1");
      final data1 = jsonDecode(respons.body);
      print(data1);

      final text = data1[0]['image'];
      final texti = data1[0]['name'];
      print(texti);
      setState(() {
        painter = text;
        pid = data1[0]['id'];
        painter1 = data1[0]['name'];
        print(pid);
      });
    } else {
      print("something wrong");
    }
  }

  getCleanApi() async {
    var url = Uri.parse('https://bcsportal.com.pk/test/cleaning.php');
    http.Response respons = await http.get(url);
    print(respons.statusCode);
    if (respons.statusCode == 200) {
      print("success2");
      final data2 = jsonDecode(respons.body);
      print(data2);
      final id2 = data2[0]['id'];
      final text2 = data2[0]['image'];
      final texti2 = data2[0]['name'];
      print(texti2);
      setState(() {
        id = id2;
        cleaning = text2;
        cleaning1 = texti2;
        print(cleaning1);
      });
    } else {
      print("something wrong");
    }
  }

  getCarApi() async {
    var url = Uri.parse('https://bcsportal.com.pk/test/car.php');
    http.Response respons = await http.get(url);
    print(respons.statusCode);
    if (respons.statusCode == 200) {
      print("success2");
      final data3 = jsonDecode(respons.body);
      print(data3);
      final id3 = data3[0]['id'];
      final text3 = data3[0]['image'];
      final texti3 = data3[0]['name'];
      print(texti3);
      setState(() {
        id = id3;
        car = text3;
        car1 = texti3;
        print(car1);
      });
    } else {
      print("something wrong");
    }
  }

  getCarpainterApi() async {
    var url = Uri.parse('https://bcsportal.com.pk/test/carpainter.php');
    http.Response respons = await http.get(url);
    print(respons.statusCode);
    if (respons.statusCode == 200) {
      print("success2");
      final data4 = jsonDecode(respons.body);
      print(data4);
      final id4 = data4[0]['id'];
      final text4 = data4[0]['image'];
      final texti4 = data4[0]['name'];
      print(texti4);
      setState(() {
        id = id4;
        carpenter = text4;
        carpenter1 = texti4;
        print(carpenter1);
      });
    } else {
      print("something wrong");
    }
  }

  getElectricApi() async {
    var url = Uri.parse('https://bcsportal.com.pk/test/electric.php');
    http.Response respons = await http.get(url);
    print(respons.statusCode);
    if (respons.statusCode == 200) {
      print("success2");
      final data5 = jsonDecode(respons.body);
      print(data5);
      final id5 = data5[0]['id'];
      final text5 = data5[0]['image'];
      final texti5 = data5[0]['name'];
      print(texti5);
      setState(() {
        id = id5;
        electric = text5;
        electric1 = texti5;
        print(electric1);
      });
    } else {
      print("something wrong");
    }
  }

  getInteriorApi() async {
    var url = Uri.parse('https://bcsportal.com.pk/test/interior.php');
    http.Response respons = await http.get(url);
    print(respons.statusCode);
    if (respons.statusCode == 200) {
      print("success2");
      final data6 = jsonDecode(respons.body);
      print(data6);
      final id6 = data6[0]['id'];
      final text6 = data6[0]['image'];
      final texti6 = data6[0]['name'];
      print(texti6);
      setState(() {
        id = id6;
        interior = text6;
        interior1 = texti6;
        print(interior1);
      });
    } else {
      print("something wrong");
    }
  }

  get w800 => null;

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Container(
    //         padding: const EdgeInsets.only(left: 25.0, top: 10.0),
    //         child: Text("Helpline",
    //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
    //       ),
    //       Container(
    //         padding: const EdgeInsets.only(right: 25.0, top: 10.0),
    //         child: Text("+9236527637",
    //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
    //       ),

    //     ],
    //   ),

    // );

    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(2, 7, 0, 7),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Column(
                        //   children: [
                        //     Padding(
                        //       padding:
                        //           const EdgeInsets.only(left: 20.0, top: 4),
                        //       child: Container(
                        //         width: MediaQuery.of(context).size.width * 0.08,
                        //         height:
                        //             MediaQuery.of(context).size.height * 0.03,
                        //         child: Image.asset("assets/phone1.jpg",
                        //             fit: BoxFit.fill),
                        //         // Container(
                        //         //                         child: Text("HelpLine",

                        //         //                             style: TextStyle(
                        //         //                                 fontWeight: FontWeight.bold, fontSize: 20)),
                        //         //                       ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Column(
                        //   children: [
                        //     Container(
                        //       child: Padding(
                        //         padding: const EdgeInsets.only(
                        //             right: 20.0, top: 7.0),
                        //         child: Text("+9236527637",
                        //             style: TextStyle(
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 15)),
                        //       ),
                        //     ),
                        //     // Container(
                        //     //                         child: Text("HelpLine",

                        //     //                             style: TextStyle(
                        //     //                                 fontWeight: FontWeight.bold, fontSize: 20)),
                        //     //                       ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width,
                            child: Carousel(
                              dotSize: 4.0,
                              dotSpacing: 15.0,
                              dotColor: Colors.pink,
                              indicatorBgPadding: 5.0,
                              dotBgColor: Colors.black.withOpacity(0.5),
                              borderRadius: true,
                              autoplay: true,
                              boxFit: BoxFit.fitWidth,
                              autoplayDuration: const Duration(seconds: 2),
                              images: users.map((data) {
                                return Image.network(
                                  data['pic'],
                                );
                              }).toList(),
                            )),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomCard(
                              borderRadius: 100,
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.3,
                              elevation: 10,
                              childPadding: 15,
                              color: Colors.white,
                              borderColor: Colors.grey.shade500,
                              borderWidth: 2,
                              hoverColor: Colors.white,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ServicesProvider(
                                          serviceName: 'Painter');
                                    },
                                  ),
                                );
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return MyHomePagee();
                                //     },
                                //   ),
                                // );
                              },
                              child: ListView(
                                children: [
                                  Column(
                                    children: [
                                      painter.isEmpty
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : Image.network(
                                              // if(painter == null){
                                              //   return
                                              // }

                                              painter,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.08,
                                            ),
                                      Text(
                                        painter1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Color(0xFFC2185B)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            CustomCard(
                              borderRadius: 100,
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.3,
                              elevation: 10,
                              childPadding: 15,
                              color: Colors.white,
                              borderColor: Colors.grey.shade500,
                              borderWidth: 2,
                              hoverColor: Colors.white,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ServicesProvider(
                                          serviceName: 'Cleaning');
                                    },
                                  ),
                                );
                              },
                              child: ListView(
                                children: [
                                  Column(
                                    children: [
                                      cleaning.isEmpty
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : Image.network(
                                              cleaning,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.20,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.08,
                                            ),
                                      Text(
                                        cleaning1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Color(0xFFC2185B)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomCard(
                        borderRadius: 100,
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.3,
                        childPadding: 15,
                        elevation: 10,
                        color: Colors.white,
                        borderColor: Colors.grey.shade500,
                        borderWidth: 2,
                        hoverColor: Colors.white,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ServicesProvider(
                                    serviceName: 'Carpainter');
                              },
                            ),
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return Viewmp();
                          //     },
                          //   ),
                          // );
                        },
                        child: ListView(
                          children: [
                            Column(
                              children: [
                                electric.isEmpty
                                    ? Center(child: CircularProgressIndicator())
                                    : Image.network(
                                        electric,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                      ),
                                Text(
                                  electric1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xFFC2185B)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CustomCard(
                        borderRadius: 100,
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.3,
                        childPadding: 15, elevation: 10,
                        color: Colors.white,
                        borderColor: Colors.grey.shade500,
                        borderWidth: 2,
                        hoverColor: Colors.white,
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return ServicesProvider(serviceName: 'Painter');
                          //     },
                          //   ),
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Body2();
                              },
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/add.gif",
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        //       child: ListView(
                        //         children: [
                        //           Column(
                        //             children: [

                        // Image.asset(
                        //                       "assets/add.gif",
                        //                        width: MediaQuery.of(context).size.width *0.25,
                        //                              height: MediaQuery.of(context).size.height *0.2,

                        //                     ),

                        //               // AnimatedIcon(icon: Icons.plus_one_rounded,)
                        //               // Image.asset(
                        //               //   "assets/logo.png",
                        //               //   width: 40,
                        //               // ),
                        //               // Text(
                        //               //   "More",
                        //               //   style: TextStyle(
                        //               //       fontWeight: FontWeight.bold, fontSize: 12),
                        //               // ),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                      ),
                      CustomCard(
                        borderRadius: 100,
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.3,
                        childPadding: 15,
                        elevation: 10,
                        color: Colors.white,
                        borderColor: Colors.grey.shade500,
                        borderWidth: 2,
                        hoverColor: Colors.white,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ServicesProvider(
                                    serviceName: 'Interior');
                              },
                            ),
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return Viewmp();
                          //     },
                          //   ),
                          // );
                        },
                        child: ListView(
                          children: [
                            Column(
                              children: [
                                carpenter.isEmpty
                                    ? Center(child: CircularProgressIndicator())
                                    : Image.network(
                                        carpenter,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                      ),
                                Text(
                                  carpenter1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xFFC2185B)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomCard(
                        borderRadius: 100,
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.3,
                        childPadding: 15,
                        elevation: 10,
                        color: Colors.white,
                        borderColor: Colors.grey.shade500,
                        borderWidth: 2,
                        hoverColor: Colors.white,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ServicesProvider(serviceName: 'CarWash');
                              },
                            ),
                          );
                        },
                        child: ListView(
                          children: [
                            Column(
                              children: [
                                car.isEmpty
                                    ? Center(child: CircularProgressIndicator())
                                    : Image.network(
                                        car,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                      ),
                                Text(
                                  car1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xFFC2185B)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CustomCard(
                        borderRadius: 100,
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.3,
                        elevation: 10,
                        childPadding: 15,
                        color: Colors.white,
                        borderColor: Colors.grey.shade500,
                        borderWidth: 2,
                        hoverColor: Colors.white,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ServicesProvider(
                                    serviceName: 'Electrician');
                              },
                            ),
                          );
                        },
                        child: ListView(
                          children: [
                            Column(
                              children: [
                                interior.isEmpty
                                    ? Center(child: CircularProgressIndicator())
                                    : Image.network(
                                        interior,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                      ),
                                Text(
                                  interior1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color(0xFFC2185B)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

imageList() {}
