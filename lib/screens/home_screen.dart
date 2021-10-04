import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_animation_flutter/components.dart/DoorLock.dart';

import 'package:tesla_animation_flutter/constrant.dart';
import 'package:tesla_animation_flutter/screens/home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeController _homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _homeController,
        builder: (context, snapshot) {
          return Scaffold(
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
                      //LEFT BUTTON LOCK
                      Positioned(
                        right: constrains.maxWidth * 0.05,
                        child: DoorLock(
                          isLock: _homeController.isRightDoorLock,
                          press: () => _homeController.updateRightDoorLock(),
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

