
import 'package:clinic_app/modules/phone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
final ZoomDrawerController z = ZoomDrawerController();

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    String myLocale = Localizations.localeOf(context).toString();
    print(myLocale);

    bool lang(){
      bool isAr=true;
      setState(() {
      {
        if (myLocale != 'en'){
          isAr= true;}
        else isAr= false;
      } });
      return isAr;
    }
  print(lang());
    return ZoomDrawer(
        isRtl: lang(),
        style: DrawerStyle.Style2,
        mainScreen: MenuScreen(),
        menuScreen: MenuPage(),

      );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Clinic"),
        leading: MenuWidget(),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      ZoomDrawer.of(context)!.toggle();
    }, icon: Icon(Icons.menu));
  }
}



class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF148e41),
     body: Padding(
       padding: const EdgeInsets.all(15.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children:[
           DrawerHeader(
             decoration: BoxDecoration(
               color: Color(0xFF148e41),
             ),
             child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
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
               Padding(
                 padding: const EdgeInsetsDirectional.only(start: 15.0),
                 child: Text(
                   AppLocalizations.of(context)!.name.toUpperCase(),
                   style: TextStyle(color: Colors.white, fontSize: 25),
                 ),
               ),
             ]),
           ),
           Divider(color: Colors.white,),
           const SizedBox(
             height: 30.0,
           ),
           TextButton(
             onPressed: () {},
             child: Text(
    AppLocalizations.of(context)!.recentAppointments.toUpperCase(),
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
               AppLocalizations.of(context)!.medicalAppointment.toUpperCase(),
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
               AppLocalizations.of(context)!.medicalProfile.toUpperCase(),
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 20,
               ),
               textAlign: TextAlign.center,
             ),
           ),
   ]  ),
     ),
    );
  }
}

    /*
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
        backdropColor: Colors.blueGrey,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(16)),
    ))


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
          )),
        body: Scaffold(
          backgroundColor: Color(0xFF4bcb66),

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
}*/
