import 'dart:convert';

import 'package:fixhome2/screens/singleperson.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServicesProvider extends StatefulWidget {
  var serviceName;

  ServicesProvider({Key key, this.serviceName}) : super(key: key);

  @override
  _ServicesProviderState createState() => _ServicesProviderState();
}

class _ServicesProviderState extends State<ServicesProvider> {
  var list = [];

  getList() async {
    final url = Uri.parse('http://www.bcsportal.com.pk/test/provider.php');
    http.Response response = await http.get(url);

    var obj = json.decode(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      for (int i = 0; i < obj.length; i++) {
        if (obj[i]['service_name'] == widget.serviceName) {
          list.add({
            'image': obj[i]['profile'],
            'name': obj[i]['name'],
            'email': obj[i]['email'],
            'service_name': obj[i]['service_name'],
            'cnic': obj[i]['cnic'],
            'contact': obj[i]['contact'],
          });
        }
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC2185B),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: MyDrawer(),
      floatingActionButton: Floart(),
      bottomNavigationBar: Mynav(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: heightScreen * 0.9,
          width: widthScreen,
          child: list.isNotEmpty
              ? ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: heightScreen * 0.14,
                      width: widthScreen,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Single(
                                        name: list[index]['name'],
                                        image: list[index]['image'],
                                        cnic: list[index]['cnic'],
                                        email: list[index]['email'],
                                        contact: list[index]['contact'],
                                        serviceName: list[index]
                                            ['service_name'],
                                      )));
                        },
                        child: Card(
                          // elevation: 2.0,
                          // shadowColor: Colors.pink[600],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  "${list[index]['image']}",
                                  width: widthScreen * 0.18,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 50, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[index]['name'],
                                        style: TextStyle(
                                     
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        list[index]['contact'],
                                        style: TextStyle(

                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        list[index]['email'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
