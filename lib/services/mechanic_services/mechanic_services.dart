import 'package:mechanic_app/models/mechanic_service/load_mechanic_items.dart';
import 'package:mechanic_app/models/mechanic_service/load_mechanic_services.dart';
import 'package:http/http.dart' as http;

class MechanicApiServices {
  Future<List<LoadMechanicItemsResponseModel>> loadMechanicItems() async {
    //Load All Car Blocks from Backend
    Uri url = Uri.parse('http://161.97.155.244/api/info/GetAllItems');
    final response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 400) {
      print("response.body:${response.body}");
      return LoadMechanicItemsResponseModel.parseMechanicItems(response.body);
    } else {
      throw Exception("failed to load Data");
    }
  }

  Future<List<LoadMechanicServicesResponseModel>> loadMechanicServices() async {
    //Load All Car Blocks from Backend
    Uri url = Uri.parse('http://161.97.155.244/api/info/GetAllServices');
    final response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 400) {
      print("response.body:${response.body}");
      return LoadMechanicServicesResponseModel.parseMechanicServices(
          response.body);
    } else {
      throw Exception("failed to load Data");
    }
  }
}
