import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixhome2/Models/models.dart';
import 'package:fixhome2/screens/dilog.dart';
import 'package:fixhome2/screens/profile.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class Single extends StatelessWidget {
  var name, email, contact, cnic, image, serviceName;

  providerModel data;
  Single(
      {this.data,
      this.name,
      this.email,
      this.contact,
      this.cnic,
      this.serviceName,
      this.image});

  TextEditingController priceController = TextEditingController();

  Future<void> createOrder() async {
    final user = FirebaseAuth.instance.currentUser;
    final userCredentials = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();

       final url = Uri.parse("http://www.bcsportal.com.pk/test/confirm.php");
    final response = await http.post(url,
        body:{
          "Customer": userCredentials.data()["name"],
          "provider": name,
          "service": serviceName,         
          "price": priceController.text,
          "datee":DateTime.now().toString()
        });
        
    final  data = json.decode(response.body);
    if(data == "Successfull") {
        Fluttertoast.showToast(
          msg: "Submitted Successfull",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
   
  }

  void showPopUp(context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text(''),
              content: SizedBox(
                height: 100,
                child: TextField(
                    controller: priceController,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        hintText: 'Enter Price',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)))),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel', style: TextStyle(color: Colors.red)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () async{
                     Navigator.of(context).pop();
                   await createOrder();
                  
                  },
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/user.gif',
              height: 80,
              width: 80,
            ),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: SafeArea(
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
                      height: 360,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Container(
                                      height: 200,
                                      // width: MediaQuery.of(context).size.width *
                                      //     0.20,
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.20,
                                      child: Image.network(image),
                                      // Container(
                                      //                         child: Text("HelpLine",

                                      //                             style: TextStyle(
                                      //                                 fontWeight: FontWeight.bold, fontSize: 20)),
                                      //                       ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20.0, top: 7.0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 18.0),
                                      child: Center(
                                        child: Text(serviceName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Container(
                                      child: Text(name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Container(
                                      child: Icon(
                                        Icons.add_moderator,
                                        color: Colors.amber.shade800,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: FlatButton(
                              color: Colors.white,
                              hoverColor: Colors.white,
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return Dilog();
                                //     },
                                //   ),
                                // );
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xFFC2185B),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.phoneAlt,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: FlatButton(
                              color: Colors.white,
                              hoverColor: Colors.white,
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
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xFFC2185B),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.envelope,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: RaisedButton(
                                onPressed: () {
                                  showPopUp(context);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40.0,
                                  width: size.width * 0.3,
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: new LinearGradient(colors: [
                                        Color(0xFFC2185B),
                                        Color(0xFFC2185B)
                                      ])),
                                  padding: const EdgeInsets.all(0),
                                  child: Text(
                                    "Confirm",
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // (ye nav ka secion hai)
            ),
          ),
        ),
      ),
      floatingActionButton: Floart(),
      bottomNavigationBar: Mynav(),
    );
  }
}

// price, service provider name, service provider serviceName, login customer name and current date