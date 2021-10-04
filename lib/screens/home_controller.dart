import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  bool isRightDoorLock = true;
  void updateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;
    print(isRightDoorLock);
    notifyListeners();
  }
}
