class ServiceRequest
{
  String requestLocation;
  String carType;
  String carNumber;
  List<String> requestedServices;
  DateTime time;
  ServiceRequest(this.requestLocation, this.carType, this.carNumber, this.requestedServices, this.time);

  // ServiceRequest.fromJson(Map<String, dynamic> json)
  // {
  //   place_id = json["place_id"];
  //   secondary_text = json["structured_formatting"]["secondary_text"];
  //   main_text = json["structured_formatting"]["main_text"];
  // }

}
