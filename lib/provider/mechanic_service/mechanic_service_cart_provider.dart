import 'package:flutter/cupertino.dart';
import 'package:mechanic_app/models/mechanic_service/load_mechanic_items.dart';
import 'package:mechanic_app/models/mechanic_service/load_mechanic_services.dart';
import 'package:mechanic_app/models/upcoming_requests/repaires_to_be_made_model.dart';

class MechanicServicesCartProvider extends ChangeNotifier {
  List<LoadMechanicItemsResponseModel> _mechanicItemsSelectedList = [];
  List<LoadMechanicServicesResponseModel> _mechanicServicesSelectedList = [];
  List<Repairsneeded> combinedCart = [];
  double _totalPrice = 0.0;
  double _subTotal = 0.0;
  double _visitFare = 0.0;

  addToMechanicItemCart(
      LoadMechanicItemsResponseModel loadMechanicItemsResponseModel) {
    if (_mechanicItemsSelectedList.contains(loadMechanicItemsResponseModel) ==
        false) {
      _mechanicItemsSelectedList.add(loadMechanicItemsResponseModel);
      _subTotal += loadMechanicItemsResponseModel.price;
      print(
          "${loadMechanicItemsResponseModel.itemDesc ?? loadMechanicItemsResponseModel.category} added successfully");
    } else
      print(
          "${loadMechanicItemsResponseModel.itemDesc ?? loadMechanicItemsResponseModel.category}Item already added");
    notifyListeners();
  }

  removeFromMechanicItemCart(
      LoadMechanicItemsResponseModel loadMechanicItemsResponseModel) {
    _mechanicItemsSelectedList.remove(loadMechanicItemsResponseModel);
    _subTotal -= loadMechanicItemsResponseModel.price;
    print(
        "${loadMechanicItemsResponseModel.itemDesc ?? loadMechanicItemsResponseModel.category} removed");
    notifyListeners();
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  addToMechanicServicesCart(
      LoadMechanicServicesResponseModel loadMechanicServicesResponseModel) {
    if (_mechanicServicesSelectedList
            .contains(loadMechanicServicesResponseModel) ==
        false) {
      _mechanicServicesSelectedList.add(loadMechanicServicesResponseModel);
      _subTotal += loadMechanicServicesResponseModel.expectedFare;
      print(
          "${loadMechanicServicesResponseModel.serviceDesc ?? loadMechanicServicesResponseModel.category} added successfully");
    } else
      print(
          "${loadMechanicServicesResponseModel.serviceDesc ?? loadMechanicServicesResponseModel.category}Item already added");
    notifyListeners();
  }

  removeFromMechanicServicesCart(
      LoadMechanicServicesResponseModel loadMechanicServicesResponseModel) {
    _mechanicServicesSelectedList.remove(loadMechanicServicesResponseModel);
    _subTotal -= loadMechanicServicesResponseModel.expectedFare;
    print(
        "${loadMechanicServicesResponseModel.serviceDesc ?? loadMechanicServicesResponseModel.category} removed");
    notifyListeners();
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  int get cartCounter {
    if (_mechanicItemsSelectedList.length +
            _mechanicServicesSelectedList.length ==
        1) _visitFare = 50.0;
    if (_mechanicItemsSelectedList.length +
            _mechanicServicesSelectedList.length ==
        0) _visitFare = 00.0;
    return _mechanicItemsSelectedList.length +
        _mechanicServicesSelectedList.length;
  }

  double get finalFare {
    return _totalPrice = _subTotal + _visitFare;
  }

  double get visitFare => _visitFare;

  double get subTotal => _subTotal;

  List<LoadMechanicItemsResponseModel> get mechanicItemsSelectedList {
    return _mechanicItemsSelectedList;
  }

  List<LoadMechanicServicesResponseModel> get mechanicServicesSelectedList {
    return _mechanicServicesSelectedList;
  }

  combineTwoCartsWithEachOther() {
    for (var j in _mechanicItemsSelectedList) {
      combinedCart.add(Repairsneeded(id: j.id, category: "item", number: "0"));
    }
    for (var j in _mechanicServicesSelectedList) {
      combinedCart
          .add(Repairsneeded(id: j.id, category: "service", number: "0"));
    }
    return combinedCart;
  }
}
