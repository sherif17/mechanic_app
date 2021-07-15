import 'package:flutter/material.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_cart_provider.dart';
import 'package:mechanic_app/provider/upcoming_mechanic_service/mechanic_request_provider.dart';
import 'package:mechanic_app/widgets/divider.dart';
import 'package:provider/provider.dart';

class ViewingDiagnosesCartDetails extends StatelessWidget {
  static String routeName = '/ViewingDiagnosesCartDetails';
  const ViewingDiagnosesCartDetails({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController controller = ScrollController();
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(1),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your diagnoses for customer car",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Consumer2<MechanicRequestProvider, MechanicServicesCartProvider>(
        builder: (context, mechanicRequestProvider,
                mechanicServicesCartProvider, child) =>
            Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0),
              child: Container(
                height: size.height * 0.9,
                child: SingleChildScrollView(
                  controller: controller,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      mechanicServicesCartProvider
                                  .mechanicItemsSelectedList.length >
                              0
                          ? buildIItemsNeeded(context, size,
                              mechanicServicesCartProvider, controller)
                          : Container(),
                      mechanicServicesCartProvider
                                  .mechanicServicesSelectedList.length >
                              0
                          ? buildServicesNeeded(context, size,
                              mechanicServicesCartProvider, controller)
                          : Container(),
                      buildPaymentSummery(
                          context, mechanicServicesCartProvider),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75))
                  ],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          child: Text("Add More To cart".toUpperCase(),
                              style: TextStyle(fontSize: 15.5)),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(16)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColorDark),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          width: 0.7,
                                          color: Theme.of(context)
                                              .primaryColorDark)))),
                          onPressed: () {
                            Navigator.pop(context);
                            //mechanicRequestProvider.rejectUpComingDiagnosis();
                          }),
                      SizedBox(width: size.width * 0.0),
                      TextButton(
                        child: mechanicRequestProvider
                                    .sendDiagnosisToCustomerIsLoading ==
                                false
                            ? Text("Send to customer".toUpperCase(),
                                style: TextStyle(fontSize: 16))
                            : CircularProgressIndicator(
                                color: Colors.white,
                              ),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(15)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.green)))),
                        onPressed: () {
                          mechanicRequestProvider
                              .sendDiagnosisToCustomer(context);
                        },
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildPaymentSummery(BuildContext context,
      MechanicServicesCartProvider mechanicServicesCartProvider) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Total Estimated Fare",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Items & Services SubTotal",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "${mechanicServicesCartProvider.subTotal} EGP",
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Estimated Visit Fare",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                "${mechanicServicesCartProvider.visitFare} EGP",
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DividerWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Estimated Fare",
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                "${mechanicServicesCartProvider.finalFare} EGP",
                style: Theme.of(context).textTheme.headline6,
              )
            ],
          ),
        )
      ],
    );
  }

  buildIItemsNeeded(BuildContext context, Size size,
      MechanicServicesCartProvider mechanicServicesCartProvider, controller) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Items Needed",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          controller: controller,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount:
              mechanicServicesCartProvider.mechanicItemsSelectedList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Align(
                alignment: loadCurrentLangFromDB() == "en"
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: Text(
                  '${mechanicServicesCartProvider.mechanicItemsSelectedList[index].itemDesc}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              subtitle: Align(
                alignment: loadCurrentLangFromDB() == "en"
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    '${mechanicServicesCartProvider.mechanicItemsSelectedList[index].category}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              trailing: GestureDetector(
                  onTap: () {
                    mechanicServicesCartProvider.removeFromMechanicItemCart(
                        mechanicServicesCartProvider
                            .mechanicItemsSelectedList[index]);
                  },
                  child: Icon(Icons.remove_circle_outline, color: Colors.red)),
              leading: GestureDetector(
                onTap: () {},
                child: Text(
                    '${mechanicServicesCartProvider.mechanicItemsSelectedList[index].price} EGP'),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Divider(
                  thickness: 1.5,
                ));
          },
        ),
      ],
    );
  }

  buildServicesNeeded(
      BuildContext context,
      Size size,
      MechanicServicesCartProvider mechanicServicesCartProvider,
      ScrollController controller) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Services To be done",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          controller: controller,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount:
              mechanicServicesCartProvider.mechanicServicesSelectedList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              // onTap: () {
              //   buildAddToCartBottomSheet(
              //       context,
              //       size,
              //       index,
              //       mechanicServiceProvider,
              //       currentLang,
              //       mechanicServicesCartProvider);
              // },
              title: Align(
                alignment: loadCurrentLangFromDB() == "en"
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: Text(
                  '${mechanicServicesCartProvider.mechanicServicesSelectedList[index].serviceDesc}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              subtitle: Align(
                alignment: loadCurrentLangFromDB() == "en"
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    '${mechanicServicesCartProvider.mechanicServicesSelectedList[index].serviceDesc}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              trailing: GestureDetector(
                  onTap: () {
                    mechanicServicesCartProvider.removeFromMechanicServicesCart(
                        mechanicServicesCartProvider
                            .mechanicServicesSelectedList[index]);
                  },
                  child: Icon(Icons.remove_circle_outline, color: Colors.red)),
              leading: GestureDetector(
                child: Text(
                    '${mechanicServicesCartProvider.mechanicServicesSelectedList[index].expectedFare} EGP'),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Divider(
                  thickness: 1.5,
                ));
          },
        ),
      ],
    );
  }
}
