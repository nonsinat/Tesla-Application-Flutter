import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
  bool isTopDoorLock = true;
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

    void updateTopDoorLock() {
    isTopDoorLock = !isTopDoorLock;
    print(isTopDoorLock);
    notifyListeners();
  }
}
