import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tesla_animation_flutter/components.dart/DoorLock.dart';
import 'package:tesla_animation_flutter/components.dart/TeslaBottomNavigationBar.dart';
import 'package:tesla_animation_flutter/components.dart/battery_status.dart';
import 'package:tesla_animation_flutter/constrant.dart';
import 'package:tesla_animation_flutter/screens/home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final HomeController _homeController = HomeController();
  late AnimationController _batteryAnimationController;
  late Animation<double> _animationBattery;
  late Animation<double> _animationBatteryStatus;

  void setupBatteryAnimation() {
    _batteryAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _animationBattery = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: Interval(0.0, 0.5),
    );

    _animationBatteryStatus = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: Interval(0.6, 1),
    );
  }

  @override
  void initState() {
    setupBatteryAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation:
            Listenable.merge([_homeController, _batteryAnimationController]),
        builder: (context, _) {
          return Scaffold(
            bottomNavigationBar: TeslaBottomNavigationBar(
              onTap: (int index) {
                if (index == 1) {
                  _batteryAnimationController.forward();
                } else if (_homeController.selectedIndex == 1 && index != 1) {
                  _batteryAnimationController.reverse(from: 0.7);
                }
                _homeController.onBottomNavigation(index);
              },
              selectedTab: _homeController.selectedIndex,
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
                      AnimatedPositioned(
                        duration: defaultDuration,
                        right: _homeController.selectedIndex == 0
                            ? constrains.maxWidth * 0.05
                            : constrains.maxWidth / 2,
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: _homeController.selectedIndex == 0 ? 1 : 0,
                          child: DoorLock(
                            isLock: _homeController.isRightDoorLock,
                            press: () => _homeController.updateRightDoorLock(),
                          ),
                        ),
                      ),

                      //LEFT BUTTON LOCK
                      AnimatedPositioned(
                        duration: defaultDuration,
                        left: _homeController.selectedIndex == 0
                            ? constrains.maxWidth * 0.05
                            : constrains.maxWidth / 2,
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: _homeController.selectedIndex == 0 ? 1 : 0,
                          child: DoorLock(
                            isLock: _homeController.isLeftDoorLock,
                            press: () => _homeController.updateLeftDoorLock(),
                          ),
                        ),
                      ),

                      //TOP BUTTON LOCK
                      AnimatedPositioned(
                        duration: defaultDuration,
                        top: _homeController.selectedIndex == 0
                            ? constrains.maxHeight * 0.15
                            : constrains.maxHeight / 2,
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: _homeController.selectedIndex == 0 ? 1 : 0,
                          child: DoorLock(
                            isLock: _homeController.isTopDoorLock,
                            press: () => _homeController.updateTopDoorLock(),
                          ),
                        ),
                      ),

                      //BOTTOM BUTTON LOCK
                      AnimatedPositioned(
                        duration: defaultDuration,
                        bottom: _homeController.selectedIndex == 0
                            ? constrains.maxHeight * 0.17
                            : constrains.maxHeight / 2,
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: _homeController.selectedIndex == 0 ? 1 : 0,
                          child: DoorLock(
                            isLock: _homeController.isBottomDoorLock,
                            press: () => _homeController.updateBottomDoorLock(),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: defaultDuration * 2,
                        opacity: _animationBattery.value,
                        child: SvgPicture.asset(
                          "assets/icons/Battery.svg",
                          width: constrains.maxWidth * 0.45,
                        ),
                      ),
                      Positioned(
                        top: 50 * (1 - _animationBatteryStatus.value),
                        height: constrains.maxHeight,
                        width: constrains.maxWidth,
                        child: Opacity(
                          opacity: _animationBatteryStatus.value,
                          child: BatteryStatus(
                            constraints: constrains,
                          ),
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
