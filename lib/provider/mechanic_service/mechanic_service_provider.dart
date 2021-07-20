import 'package:flutter/cupertino.dart';
import 'package:mechanic_app/models/mechanic_service/load_mechanic_items.dart';
import 'package:mechanic_app/models/mechanic_service/load_mechanic_services.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_cart_provider.dart';
import 'package:mechanic_app/services/mechanic_services/mechanic_services.dart';
import 'package:provider/provider.dart';

class MechanicServiceProvider extends ChangeNotifier {
  List<LoadMechanicItemsResponseModel> mechanicItemsApiList = [];
  List<LoadMechanicServicesResponseModel> mechanicServicesApiList = [];

  Map<dynamic, List<LoadMechanicItemsResponseModel>> mechanicItemsMap = {};
  Map<dynamic, List<LoadMechanicServicesResponseModel>> mechanicServicesMap =
      {};
  MechanicApiServices mechanicApiServices = new MechanicApiServices();
  bool loading = false;

  getMechanicItemsFromBackend() async {
    loading = true;
    mechanicItemsApiList = await mechanicApiServices.loadMechanicItems();
    loading = false;
    mechanicItemsApiList.forEach((element) {
      print(element);
    });
    for (var j in mechanicItemsApiList) {
      if (mechanicItemsMap.containsKey(j.category)) {
        mechanicItemsMap
            .putIfAbsent(j.category, () => null)
            .add(LoadMechanicItemsResponseModel(
                id: j.id,
                category: j.category,
                itemDesc: j.itemDesc,
                price: j.price,
                // problem: j.problem,
                // subproblem: j.subproblem,
                // expectedFare: j.expectedFare,
                v: j.v));
      } else
        mechanicItemsMap.addAll({
          j.category: [
            LoadMechanicItemsResponseModel(
                id: j.id,
                category: j.category,
                itemDesc: j.itemDesc,
                price: j.price,
                // problem: j.problem,
                // subproblem: j.subproblem,
                // expectedFare: j.expectedFare,
                v: j.v)
          ]
        });
    }
    mechanicItemsMap.forEach((key, value) {
      print('$key: ${value}');
    });
    notifyListeners();
  }

  getMechanicServicesFromBackend() async {
    loading = true;
    mechanicServicesApiList = await mechanicApiServices.loadMechanicServices();
    loading = false;
    // mechanicServicesApiList.forEach((element) {
    //   print("${element.category + " " + element.serviceDesc}");
    // });
    for (var j in mechanicServicesApiList) {
      if (mechanicServicesMap.containsKey(j.category.trim())) {
        mechanicServicesMap.putIfAbsent(j.category.trim(), () => null).add(
            LoadMechanicServicesResponseModel(
                id: j.id,
                category: j.category,
                expectedFare: j.expectedFare,
                serviceDesc: j.serviceDesc,
                v: j.v));
      } else if (mechanicServicesMap.containsKey(j.category.trim()) == false) {
        mechanicServicesMap.addAll({
          j.category.trim(): [
            LoadMechanicServicesResponseModel(
                id: j.id,
                category: j.category,
                expectedFare: j.expectedFare,
                serviceDesc: j.serviceDesc,
                v: j.v)
          ]
        });
      } else
        print("hi");
    }
    mechanicServicesMap.forEach((key, value) {
      print('$key: ${value}');
    });
    notifyListeners();
  }

  getSubItemSelectionState({itemIndex, subItemIndex}) {
    return mechanicItemsMap.values.elementAt(itemIndex)[subItemIndex].isChecked;
  }

  onChangeItemSelectionState({bool val, itemIndex, subItemIndex, context}) {
    mechanicItemsMap.values.elementAt(itemIndex)[subItemIndex].isChecked = val;
    if (val == true) {
      Provider.of<MechanicServicesCartProvider>(context, listen: false)
          .addToMechanicItemCart(
              mechanicItemsMap.values.elementAt(itemIndex)[subItemIndex]);
    } else {
      Provider.of<MechanicServicesCartProvider>(context, listen: false)
          .removeFromMechanicItemCart(
              mechanicItemsMap.values.elementAt(itemIndex)[subItemIndex]);
    }
    notifyListeners();
  }

  getSubServicesSelectionState({serviceIndex, subServiceIndex}) {
    return mechanicServicesMap.values
        .elementAt(serviceIndex)[subServiceIndex]
        .isChecked;
  }

  onChangeServiceSelectionState(
      {bool val, serviceIndex, subServiceIndex, context}) {
    mechanicServicesMap.values
        .elementAt(serviceIndex)[subServiceIndex]
        .isChecked = val;
    if (val == true) {
      Provider.of<MechanicServicesCartProvider>(context, listen: false)
          .addToMechanicServicesCart(mechanicServicesMap.values
              .elementAt(serviceIndex)[subServiceIndex]);
    } else {
      Provider.of<MechanicServicesCartProvider>(context, listen: false)
          .removeFromMechanicServicesCart(mechanicServicesMap.values
              .elementAt(serviceIndex)[subServiceIndex]);
    }
    notifyListeners();
  }
}
