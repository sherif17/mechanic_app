import 'package:flutter/cupertino.dart';
import 'package:mechanic_app/models/mechanic_service/load_mechanic_items.dart';
import 'package:mechanic_app/models/mechanic_service/load_mechanic_services.dart';
import 'package:mechanic_app/services/mechanic_services/mechanic_services.dart';

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
    mechanicServicesApiList.forEach((element) {
      print(element);
    });
    for (var j in mechanicServicesApiList) {
      if (mechanicItemsMap.containsKey(j.category)) {
        mechanicServicesMap
            .putIfAbsent(j.category, () => null)
            .add(LoadMechanicServicesResponseModel(
                id: j.id,
                category: j.category,
                expectedFare: j.expectedFare,
                serviceDesc: j.serviceDesc,
                // itemDesc: j.itemDesc,
                // price: j.price,
                // problem: j.problem,
                // subproblem: j.subproblem,
                // expectedFare: j.expectedFare,
                v: j.v));
      } else
        mechanicServicesMap.addAll({
          j.category: [
            LoadMechanicServicesResponseModel(
                id: j.id,
                category: j.category,
                expectedFare: j.expectedFare,
                serviceDesc: j.serviceDesc,
                // itemDesc: j.itemDesc,
                // price: j.price,
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
}
