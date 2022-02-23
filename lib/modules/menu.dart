import 'package:clinic_app/modules/phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Clinic",style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            if (!scaffoldKey.currentState!.isDrawerOpen) {
              //check if drawer is closed
              scaffoldKey.currentState!.openDrawer(); //open drawer
            }
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(
            //header of drawer
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Image.asset(
              'images/img.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Name"),
          ),
          ListTile(
            title: Text("Recent appointments"),
          ),
          ListTile(
            title: Text('Medical appointment'),
          ),
          ListTile(
              title: Text('Medical Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhoneNumber()));
              }),

        ]),
      ),
    );
  }
}
