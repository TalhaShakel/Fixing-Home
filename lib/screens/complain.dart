import 'dart:convert';
import 'dart:io';

import 'package:fixhome2/login/component/background.dart';
import 'package:fixhome2/screens/HomePage.dart';
import 'package:fixhome2/screens/profile.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Complain extends StatefulWidget {
  const Complain({Key key}) : super(key: key);

  @override
  State<Complain> createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController msg = TextEditingController();
  Future complaint() async {
    String url = "http://www.bcsportal.com.pk/test/complaint.php";
    var response = await http.post(Uri.parse(url), body: {
      "name": name.text,
      "email": email.text,
      "user": user.text,
      "msg": msg.text,
    });
    var data = json.decode(response.body);
    if (data != "Error") {
       Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  reverseDuration: Duration(seconds: 1),
                                  duration: Duration(seconds: 1),
                                  child: MyHomePage()));
    } else {
     
    }
  }

  get w800 => null;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Color(0xFFC2185B)),
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFC2185B), width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // errorBorder:
                          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                          // focusedErrorBorder:
                          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                          // errorStyle: TextStyle(color: Colors.purple),
                        ),
                        controller: name,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Color(0xFFC2185B)),
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFC2185B), width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // errorBorder:
                          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                          // focusedErrorBorder:
                          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                          // errorStyle: TextStyle(color: Colors.purple),
                        ),
                        controller: email,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Color(0xFFC2185B)),
                          labelText: 'Username for complain',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFC2185B), width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // errorBorder:
                          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                          // focusedErrorBorder:
                          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                          // errorStyle: TextStyle(color: Colors.purple),
                        ),
                        controller: user,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Color(0xFFC2185B)),
                          labelText: 'Complain',
                          border: OutlineInputBorder(gapPadding: 20.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFC2185B), width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // errorBorder:
                          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                          // focusedErrorBorder:
                          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                          // errorStyle: TextStyle(color: Colors.purple),
                        ),
                        controller: msg,
                      ),
                    ],
                  ),
                )),
            ButtonWidget(
                text: "Submit",
                onClicked: () {
                  complaint();
                })
          ],
        ),
      ),
      floatingActionButton: Floart(),
      bottomNavigationBar: Mynav(),
    );
  }
}
// class MyCustomForm2 extends StatefulWidget {
//   const MyCustomForm2({Key? key}) : super(key: key);

//   @override
//   MyCustomForm2State createState() {
//     return MyCustomForm2State();
//   }
// }

// // Create a corresponding State class.
// // This class holds data related to the form.
// class MyCustomForm2State extends State<MyCustomForm2> {
//   // Create a global key that uniquely identifies the Form widget
//   // and allows validation of the form.
//   //
//   // Note: This is a GlobalKey<FormState>,
//   // not a GlobalKey<MyCustomFormState>.
//   final _formKey = GlobalKey<FormState>();

//   get pass => null;

//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
// //     return Form(
// //       key: _formKey,
// //       child: Padding(
// //         padding: const EdgeInsets.all(15.0),
// //         child: SingleChildScrollView(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [

// //               Center(
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Container(
// //                         width: 300,
// //                         alignment: Alignment.center,
// //                         margin: EdgeInsets.symmetric(horizontal: 40),
// //                         child: TextFormField(
// //                           validator: (value) {
// //                       if (value == null || value.isEmpty) {
// //                         return 'Please enter some text';
// //                       }
// //                       return null;
// //                     },
// //                           decoration: InputDecoration(
// //                             labelText: "Enter Name",
// //                             labelStyle: TextStyle(color: Color(0xFFC2185B)),
// //                             hintText: "Rida Zehra",

// //                             fillColor: Color(0xFFC2185B),
// //                             focusedBorder: OutlineInputBorder(
// //                               borderSide: const BorderSide(
// //                                   color: Color(0xFFC2185B), width: 2.0),
// //                               borderRadius: BorderRadius.circular(15.0),
// //                             ),
// //                           ),
// //                             controller: pass,
// //                         )),
// //                 ),
// //               ),

// //                     Center(
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: Container(
// //                         width: 300,
// //                         alignment: Alignment.center,
// //                         margin: EdgeInsets.symmetric(horizontal: 40),
// //                         child: TextFormField(
// //                           validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                         return 'Please enter your valid name';
// //                   }
// //                   return null;
// //                 },
// //                           decoration: InputDecoration(

// //                             labelText: "Provider Number",
// //                             labelStyle: TextStyle(color: Color(0xFFC2185B)),
// //                             hintText: "+923340210117",

// //                             fillColor: Color(0xFFC2185B),
// //                             focusedBorder: OutlineInputBorder(
// //                               borderSide: const BorderSide(
// //                                   color: Color(0xFFC2185B), width: 2.0),
// //                               borderRadius: BorderRadius.circular(15.0),
// //                             ),
// //                           ),
// //                             controller: pass,
// //                         )),
// //                       ),
// //                     ),

// //               Padding(
// //                 padding: const EdgeInsets.symmetric(vertical: 16.0),

// //                 child: Center(
// //                   child: ElevatedButton(
// //                     style: ElevatedButton.styleFrom(shadowColor:Color(0xFFC2185B),primary: Color(0xFFC2185B), ),
// //                     onPressed: () {
// //                       // Validate returns true if the form is valid, or false otherwise.
// //                       if (_formKey.currentState!.validate()) {
// //                         // If the form is valid, display a snackbar. In the real world,
// //                         // you'd often call a server or save the information in a database.
// //                         ScaffoldMessenger.of(context).showSnackBar(
// //                           const SnackBar(content: Text('Processing Data')),
// //                         );
// //                       }
// //                     },
// //                     child: const Text('Submit',),

// //                   ),

// //                 ),
// //               ),
// //             ],

// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    @required this.text,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 150,
          decoration: new BoxDecoration(
            color: Color(0xFFC2185B),
            borderRadius: BorderRadius.circular(10.0),
            // gradient: new LinearGradient(
            // colors: [Color(0xFFC2185B), Color(0xFFC2185B)]
          ),
          padding: const EdgeInsets.all(0),
          child: Text(
            "Submit",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // color: Theme.of(context).primaryColor,

        textColor: Colors.white,
        onPressed: onClicked,
      );
}
