import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tesla_animation_flutter/components.dart/DoorLock.dart';
import 'package:tesla_animation_flutter/components.dart/TeslaBottomNavigationBar.dart';

import 'package:tesla_animation_flutter/screens/home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeController _homeController = HomeController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _homeController,
        builder: (context, snapshot) {
          return Scaffold(
            bottomNavigationBar: TeslaBottomNavigationBar(
              onTap: (int value) {
                setState(() {
                  currentIndex = value;
                  print(currentIndex);
                });
              },
              selectedTab: currentIndex,
            ),
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constrains) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: constrains.maxHeight * .1),
                        child: SvgPicture.asset(
                          "assets/icons/Car.svg",
                          width: double.infinity,
                        ),
                      ),
                      //RIGHT BUTTON LOCK
                      Positioned(
                        right: constrains.maxWidth * 0.05,
                        child: DoorLock(
                          isLock: _homeController.isRightDoorLock,
                          press: () => _homeController.updateRightDoorLock(),
                        ),
                      ),

                      //LEFT BUTTON LOCK
                      Positioned(
                        left: constrains.maxWidth * 0.05,
                        child: DoorLock(
                          isLock: _homeController.isLeftDoorLock,
                          press: () => _homeController.updateLeftDoorLock(),
                        ),
                      ),

                      //TOP BUTTON LOCK
                      Positioned(
                        top: constrains.maxWidth * 0.30,
                        child: DoorLock(
                          isLock: _homeController.isTopDoorLock,
                          press: () => _homeController.updateTopDoorLock(),
                        ),
                      ),

                      //BOTTOM BUTTON LOCK
                      Positioned(
                        bottom: constrains.maxWidth * 0.40,
                        child: DoorLock(
                          isLock: _homeController.isBottomDoorLock,
                          press: () => _homeController.updateBottomDoorLock(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        });
  }
}
