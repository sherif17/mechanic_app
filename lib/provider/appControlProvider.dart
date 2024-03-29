import 'package:flutter/cupertino.dart';
import 'package:mechanic_app/screens/dash_board/home/upcoming_request/upcoming_request.dart';

class AppControlProvider extends ChangeNotifier {
  //bool mechanicState = false;
  bool newRequestAvailable = false;
  bool addServiceButtonState = true;
  String currentPage = "Main";
  List<String> services = ["Tire", "Fuel", "Check Motor", "Oil"];
  List<bool> checked = [false, false, false, false];
  bool completeServiceButtonEnabled = false;
  int checkedBoxes = 0;

  // updateMechanicState(bool mechState,BuildContext context)
  // {
  //   mechanicState = mechState;
  //   if(mechanicState==true){
  //   }
  //   notifyListeners();
  // }

  updateAddServiceButtonState(bool buttonState) {
    addServiceButtonState = buttonState;
    notifyListeners();
  }

  updateCurrentPage(String current) {
    currentPage = current;
    notifyListeners();
  }

  addNewService(String newService) {
    services.add(newService);
    checked.add(false);
    notifyListeners();
  }

  setInitialCheckedState() {
    int i = 0;
    if (i < services.length) {
      checked.add(false);
      i -= 1;
    }
    notifyListeners();
  }

  checkThisBox(int index) {
    checked[index] = true;
    checkedBoxes += 1;
    if (checkedBoxes == services.length) {
      completeServiceButtonEnabled = true;
    }
    notifyListeners();
  }

  uncheckThisBox(int index) {
    checked[index] = false;
    if (completeServiceButtonEnabled) {
      completeServiceButtonEnabled = false;
    }
    checkedBoxes -= 1;
    notifyListeners();
  }
}
