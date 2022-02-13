import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixhome2/compnent/services.dart';
import 'package:fixhome2/screens/HomePage.dart';
import 'package:fixhome2/screens/profile.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  get w800 => null;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.user),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Profile();
                  },
                ),
              );
            },
          ),
        ],
        backgroundColor: Color(0xFFC2185B),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: MyDrawer(),
      body: FutureBuilder(
          future: getOrder(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //            ServicesProvider(serviceName:  "${snapshot.data[index].name}")));
                          },
                          child: CustomCard(
                              borderRadius: 10,
                              height: MediaQuery.of(context).size.height * 0.14,
                              width: MediaQuery.of(context).size.width * 0.85,
                              elevation: 10,
                              childPadding: 3,
                              color: Colors.white,
                              borderColor: Colors.grey.shade500,
                              borderWidth: 2,
                              hoverColor: Colors.pink.shade50,
                              child: ListView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 45.0),
                                              child: Text(
                                                "${snapshot.data[index].service}",
                                                style: TextStyle(
                                                    letterSpacing: 1,
                                                    fontFamily: "crimson",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 19),
                                              ),
                                            ),
                                            // Text("${snapshot.data[index].id}"),
                                            Text(
                                              "${snapshot.data[index].provider}"
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  letterSpacing: 1,
                                                  fontFamily: "crimson",
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              "${snapshot.data[index].name}"
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  letterSpacing: 1,
                                                  fontFamily: "crimson",
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              "${snapshot.data[index].price}",
                                              style: TextStyle(
                                                  letterSpacing: 1,
                                                  fontFamily: "crimson",
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 15),
                                            ),
                                          ],
                                          //             ),

                                          // child: ListTile(
                                          //   leading: Text("${snapshot.data[index].Id}"),
                                          //   title: Text("${snapshot.data[index].name}"),

                                          // ),
                                        ),
                                        Text(
                                          "${snapshot.data[index].date}",
                                          style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "crimson",
                                              fontWeight: FontWeight.normal,
                                              color: Colors.pink,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // child: Container(
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                  //     children: <Widget>[
                                  //       CustomCard(
                                  //         borderRadius: 10,
                                  //         height: MediaQuery.of(context).size.height * 0.14,
                                  //         width: MediaQuery.of(context).size.width * 0.85,
                                  //         elevation: 10,
                                  //         childPadding: 3,
                                  //         color: Colors.white,
                                  //         borderColor: Colors.grey.shade500,
                                  //         borderWidth: 2,
                                  //         hoverColor: Colors.pink.shade50,
                                  //         onTap: () {
                                  //           // Navigator.push(
                                  //           //   context,
                                  //           //   MaterialPageRoute(
                                  //           //     builder: (context) {
                                  //           //       return Viewmp();
                                  //           //     },
                                  //           //   ),
                                  //           // );
                                  //         },
                                  //         child: ListView(
                                  //           children: [
                                  //             Row(
                                  //               mainAxisAlignment:
                                  //                   MainAxisAlignment.spaceBetween,
                                  //               children: [
                                  //                 Padding(
                                  //                   padding: const EdgeInsets.only(
                                  //                     left: 45.0,
                                  //                   ),
                                  //                   child: Image.network(
                                  //                     "${snapshot.data[index].image}",
                                  //                     width: 75,
                                  //                   ),
                                  //                 ),
                                  //                 Padding(
                                  //                   padding:
                                  //                       const EdgeInsets.only(right: 45.0),
                                  //                   child: Text(
                                  //                     "${snapshot.data[index].name}",
                                  //                     style: TextStyle(
                                  //                         fontWeight: FontWeight.bold,
                                  //                         fontSize: 18),
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              )));
                    }),
              );
            }
          }),
      floatingActionButton: Floart(),
      bottomNavigationBar: Mynav(),
    );
  }
}
