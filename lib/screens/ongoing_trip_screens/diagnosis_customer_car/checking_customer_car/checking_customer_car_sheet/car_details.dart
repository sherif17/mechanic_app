import 'package:flutter/material.dart';
import 'package:mechanic_app/provider/upcoming_mechanic_service/mechanic_request_provider.dart';
import 'package:mechanic_app/widgets/divider.dart';
import 'package:provider/provider.dart';

class CarDetails extends StatefulWidget {
  const CarDetails({key}) : super(key: key);

  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<MechanicRequestProvider>(
      builder: (context, mechanicRequestProvider, child) => Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildCarDetailsContainer(context, size, mechanicRequestProvider),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Customer Info",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: size.height * 0.15,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.7),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Name"),
                                  Text(
                                      "${(mechanicRequestProvider.upcomingRequestResponseModel.firstName ?? "FName") + " " + (mechanicRequestProvider.upcomingRequestResponseModel.lastName ?? "LName")}")
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DividerWidget(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Phone Number"),
                                  Text(
                                      "${mechanicRequestProvider.upcomingRequestResponseModel.phoneNumber ?? "Phone Number"}")
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Column buildCarDetailsContainer(BuildContext context, Size size,
      MechanicRequestProvider mechanicRequestProvider) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Car Details",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: size.height * 0.3,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.7),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Brand"),
                        Text(
                            "${mechanicRequestProvider.getNearestClientResponseModel.carBrand ?? "Brand"}")
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DividerWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Model"),
                        Text(
                            "${mechanicRequestProvider.getNearestClientResponseModel.carModel ?? "Model"}")
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DividerWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Year of production"),
                        Text(
                            "${mechanicRequestProvider.getNearestClientResponseModel.carYear ?? "Year"}")
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DividerWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Car Plates"),
                        Text(
                            "${mechanicRequestProvider.getNearestClientResponseModel.carPlates ?? "plates"}")
                      ]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
