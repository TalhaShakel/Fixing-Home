import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fixhome2/login/component/background.dart';
import 'package:fixhome2/login/login.dart';
import 'package:fixhome2/login/otp.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MyRegister(),
    );
  }
}

class MyRegister extends StatefulWidget {
  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  String value = "";
  // void getcurrent() async {
  //   var position = await GeolocatorPlatform.instance. getCurrentPosition(locationSettings: );
  // }
   static final auth = FirebaseAuth.instance;

  userStore() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    String uid = await auth.currentUser.uid;

    try {
      await db.collection("Users").doc(uid).set({
        "name": name.text,
        "email": email.text,
        "phone": phone.text,
        "password": pass.text
      });
      print("User is register");
    } catch (e) {
      print("ERROR");
    }
  }

  final databaseref = FirebaseDatabase.instance.ref();
  String emaill = '';
  String password = '';
  var location;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();

  void getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    print(await Geolocator.getCurrentPosition());
    location = await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void insertData(String name, String email, String phone, String pass) {
    databaseref.child("users").set({
      'name': name,
      'email': email,
      'phone': phone,
      'pass': pass,
    });
  }

  Future register() async {
    print('location here');
    print(location.toString());

    String url = "http://www.bcsportal.com.pk/test/signup.php";
    var response = await http.post(Uri.parse(url), body: {
      "name": name.text,
      "password": pass.text,
      "email": email.text,
      "phoneno": phone.text,
      "location": location.toString(),
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "User Already Exist",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Successfull",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: new AppBar(
      //   backgroundColor: Colors.white,
      //   leading: new IconButton(
      //     icon: new Icon(Icons.arrow_back,
      //     color: Colors.black,
      //     ),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => LoginScreen()),
      //       );
      //     },
      //   ),
      // ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  alignment: Alignment.center,

                  // child: Image.asset("assets/logo.png", width: size.width * 0.45),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("REGISTER",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                  width: 300,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      labelStyle: TextStyle(color: Color(0xFFC2185B)),
                      icon: Icon(
                        Icons.person_outline,
                        color: Color(0xFFC2185B),
                      ),
                      fillColor: Color(0xFFC2185B),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFC2185B), width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    controller: name,
                  )),
              SizedBox(height: size.height * 0.03),
              Container(
                  width: 300,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    onChanged: (value) {
                      emaill = value.toString().trim();
                    },
                    decoration: InputDecoration(
                      labelText: "Enter Email Address",
                      labelStyle: TextStyle(color: Color(0xFFC2185B)),
                      icon: Icon(
                        Icons.email_outlined,
                        color: Color(0xFFC2185B),
                      ),
                      fillColor: Color(0xFFC2185B),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFC2185B), width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    controller: email,
                  )),
              SizedBox(height: size.height * 0.03),
              Container(
                  width: 300,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    onChanged: (text) {
                      value = text;
                    },
                    decoration: InputDecoration(
                      labelText: "Enter Phone No (Like, 3152952878)",
                      labelStyle: TextStyle(color: Color(0xFFC2185B)),
                      icon: Icon(
                        Icons.phone,
                        color: Color(0xFFC2185B),
                      ),
                      fillColor: Color(0xFFC2185B),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFC2185B), width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    controller: phone,
                  )),
              SizedBox(height: size.height * 0.03),
              Container(
                  width: 300,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      labelText: "Enter Password",
                      labelStyle: TextStyle(color: Color(0xFFC2185B)),
                      icon: Icon(
                        Icons.lock_open,
                        color: Color(0xFFC2185B),
                      ),
                      fillColor: Color(0xFFC2185B),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFC2185B), width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    controller: pass,
                  )),
              SizedBox(height: size.height * 0.03),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      child: RaisedButton(
                        onPressed: () async {
                          await auth.createUserWithEmailAndPassword(
                              email: emaill, password: password);
                          userStore();
                          // register();
                          // insertData(
                          //     name.text, email.text, phone.text, pass.text);
                          // Navigator.push(
                          //     context,
                          //     PageTransition(
                          //         type: PageTransitionType.rightToLeft,
                          //         reverseDuration: Duration(seconds: 1),
                          //         duration: Duration(seconds: 1),
                          //         child: MyOtp(value: value)));
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
                            "SIGNUP",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            reverseDuration: Duration(seconds: 1),
                            duration: Duration(seconds: 1),
                            child: LoginScreen()))
                  },
                  child: Text(
                    "Already Have Account ? Signin",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC2185B)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
