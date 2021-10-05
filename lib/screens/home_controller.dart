import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  int selectedIndex = 0;

  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
  bool isBottomDoorLock = true;
  bool isTopDoorLock = true;

  void onBottomNavigation(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void updateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;
    print(isRightDoorLock);
    notifyListeners();
  }

  void updateLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    print(isLeftDoorLock);
    notifyListeners();
  }

  void updateBottomDoorLock() {
    isBottomDoorLock = !isBottomDoorLock;
    print(isBottomDoorLock);
    notifyListeners();
  }

  void updateTopDoorLock() {
    isTopDoorLock = !isTopDoorLock;
    print(isTopDoorLock);
    notifyListeners();
  }
}
