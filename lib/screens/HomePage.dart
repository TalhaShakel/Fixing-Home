


import 'dart:io';

import 'package:fixhome2/login/authentication.dart';
import 'package:fixhome2/screens/body1.dart';
import 'package:fixhome2/screens/profile.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // (ye app bar hai)
    appBar:AppBar(
     
      actions: [
        
      IconButton(
                enableFeedback: false,
                onPressed: () {
            
                  
                }, 
                // icon: Icon(
                //   Icons.home_outlined,
                //   color: Colors.white,
                //   size: 35,
                // ),
           icon: Icon(FontAwesomeIcons.user,
   //Icon Size
    color: Colors.white, //Color Of Icon
)
              ),
    ],
      backgroundColor: Color(0xFFC2185B),
        iconTheme: IconThemeData(color: Colors.white,),
    ) ,


        //  (ye drawer hai)
        drawer:MyDrawer(),
        body:Body1(),


        // (ye nav ka secion hai)
   
floatingActionButton:Floart(),


  
        // (ye nav ka secion hai)
      //    floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      // floatingActionButton: Container(

      //   height: 60.0,
      //   width: 60.0,
      //   child: FittedBox(
      //     child:FloatingActionButton(backgroundColor:  Colors.orangeAccent,
      
        
        
        
      //   onPressed:(){ Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) {
      //                         return MyHomePage ();
      //                       },
      //                     ),
      //                   ); },
        
      //   child: new Icon(Icons.home),
      // ),
      //   ),
      // ),
      // new FloatingActionButton(backgroundColor:  Colors.orangeAccent,
      
        
        
        
      //   onPressed:(){  },
        
      //   child: new Icon(Icons.home),
      // ),
        bottomNavigationBar: Mynav(),

    );
  }
}
