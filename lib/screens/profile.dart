import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  get w800 => null;



  @override
  Widget build(BuildContext context) {
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
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
                .collection("Users")
                .doc(FirebaseAuth.instance.currentUser.uid)
                .snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return  Padding(
                  padding: EdgeInsets.all(55.0),
                  child: const Center(
                      child: CircularProgressIndicator(color: Colors.white)),
                );
          }
          final myData = snapshot.data.data() as Map<dynamic, dynamic>;
          return MyCustomForm(myData);
        }
      ),
      floatingActionButton: Floart(),
      bottomNavigationBar: Mynav(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  Map<String, dynamic> data;
   MyCustomForm(this.data,{Key key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  get pass => null;

  Map<String, dynamic> userData = {
    "name": null,
    "password": null,
    "phone": null,
    
  };

  Future<void> editProfile(data) async {

   
    _formKey.currentState.save();

    final user = FirebaseAuth.instance.currentUser;
    final userData =  FirebaseFirestore.instance.collection("users").doc(user.uid);

    if (user != null) {
      await userData.update({
      "name": data["name"],
      "password": data["password"],
      "phone": data["phone"],
   
    }).then((value) {
      Fluttertoast.showToast(
          msg: "Profile Updated",
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.grey[800],
          textColor: Colors.white,
          fontSize: 12.0);
    }).catchError((error) {
      Fluttertoast.showToast(
          msg: "Something went wrong",
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.grey[800],
          textColor: Colors.white,
          fontSize: 12.0);
    });

     
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Image.asset("assets/user.gif"),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 300,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        initialValue: widget.data["name"] ?? "",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (value) {
                                  userData["name"] = value;
                                },
                        decoration: InputDecoration(
                          
                          labelText: "Enter Name",
                          labelStyle: TextStyle(color: Color(0xFFC2185B)),
                          hintText: "Rida Zehra",
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
                        controller: pass,
                      )),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 300,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        initialValue: widget.data["password"] ?? "",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your valid name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                                  userData["password"] = value;
                                },
                        decoration: InputDecoration(
                          
                          labelText: "Enter password",
                          labelStyle: TextStyle(color: Color(0xFFC2185B)),
                          hintText: "*****",
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
                        controller: pass,
                      )),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 300,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        initialValue: widget.data["phone"] ?? "",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (value) {
                                  userData["phone"] = value;
                                },
                        decoration: InputDecoration(
                          labelText: "Enter Phone No.",
                          labelStyle: TextStyle(color: Color(0xFFC2185B)),
                          hintText: "+923340210117",
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
                        controller: pass,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Color(0xFFC2185B),
                      primary: Color(0xFFC2185B),
                    ),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState.validate()) {
                       editProfile(userData);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text(
                      'update',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}