import 'package:clinic_app/modules/phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
final _advancedDrawerController = AdvancedDrawerController();

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        backdropColor: Colors.blueGrey,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
    animateChildDecoration: true,
    rtlOpening: false,
    disabledGestures: false,
    childDecoration: const BoxDecoration(
    // NOTICE: Uncomment if you want to add shadow behind the page.
    // Keep in mind that it may cause animation jerks.
    // boxShadow: <BoxShadow>[
    //   BoxShadow(
    //     color: Colors.black12,
    //     blurRadius: 0.0,
    //   ),
    // ],
    borderRadius: const BorderRadius.all(Radius.circular(16)),
    ),

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Clinic'),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: Container(),
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
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
