import 'package:flutter/material.dart';
import 'package:gems/pages/home/home_screen.dart';
import 'package:gems/utils/color.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleHiddenDrawer(
      menu: Menu(),
      screenSelectedBuilder: (index, controller) {
        Widget? screenCurrent;
        switch (index) {
          case 0:
            screenCurrent = HomeScreen();
            break;
          case 1:
            // screenCurrent = SecondScreen();
            break;
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                controller.toggle();
              },
            ),
            elevation: 0,
            title: Column(
              children: [
                Text(
                  'Location',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Text(
                  'Ho Chi Minh City',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ],
            ),
            centerTitle: true,
            actions: [
              CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  maxRadius: 20,
                  child: Icon(Icons.person, color: Colors.white)),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: screenCurrent,
        );
      },
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  AnimationController? animationController;
  SimpleHiddenDrawerController? controller;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller = SimpleHiddenDrawerController.of(context);
    controller!.addListener(() {
      if (controller!.state == MenuState.open) {
        animationController!.forward();
      }

      if (controller!.state == MenuState.closing) {
        animationController!.reverse();
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: kPrimaryColor,
            body: SafeArea(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: kPrimaryColor),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Katana',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Text('Active Status',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Setting',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(' | ', style: TextStyle(color: Colors.white)),
                      SizedBox(
                        width: 20,
                      ),
                      Text('logout', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          FadeTransition(
            opacity: animationController!,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildButton(
                        iconData: Icons.home,
                        label: 'Home Screen',
                        onPressed: () {
                          controller!.setSelectedMenuPosition(0);
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    buildButton(
                        iconData: Icons.home,
                        label: 'Detail Screen',
                        onPressed: () {
                          controller!.setSelectedMenuPosition(1);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildButton({
    IconData? iconData = Icons.home,
    String? label,
    required VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: 200.0,
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              '$label',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
