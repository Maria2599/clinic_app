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
      backdropColor: Color(0xFF148e41),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4bcb66),
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
        body: Scaffold(
          backgroundColor: Color(0xFF4bcb66),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF148e41),
        child: ListView(
            children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.only(top: 16.0),
            decoration: BoxDecoration(
              color: Color(0xFF148e41),
            ),
            child: Column(children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: AssetImage(
                      'images/img.jpg',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "NAME",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ]),
          ),
          Divider(color: Colors.white,),
          const SizedBox(
            height: 20.0,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Recent appointments".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Medical appointment'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PhoneNumber()));
            },
            child: Text(
              'Medical Profile'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
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
