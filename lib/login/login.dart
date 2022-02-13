import 'package:fixhome2/register/register.dart';
import 'package:fixhome2/screens/HomePage.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'authentication.dart';
import 'component/background.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ',
      home: MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  Future login() async {
    var url = "http://www.bcsportal.com.pk/test/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": email.text,
      "pass": pass.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "login Sunccessfully",
          
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    } else {
      Fluttertoast.showToast(
          msg: "Invalid",
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
      //     icon: new Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
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
                    child: Text("LOGIN",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                  alignment: Alignment.center,
                  width: 300,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email Address",
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
                    controller: email,
                  )),
              SizedBox(height: size.height * 0.03),
              Container(
                  width: 300,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
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
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(fontSize: 12, color: Colors.blueAccent),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () {
                    // login();
                    AuthenticationHelper()
                        .signIn(email: email.toString(), password: pass.toString())
                        .then((result) {
                      if (result != null) {
                        Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            reverseDuration: Duration(seconds: 1),
                            duration: Duration(seconds: 1),
                            child: MyHomePage()));

                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            result,
                            style: TextStyle(fontSize: 16),
                          ),
                        ));
                      }
                    });
                    // login();
                    
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
                        gradient: new LinearGradient(
                            colors: [Color(0xFFC2185B), Color(0xFFC2185B)])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
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
                            child: RegisterScreen())),
                  },
                  child: Text(
                    "Create Your Account ?Signup",
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