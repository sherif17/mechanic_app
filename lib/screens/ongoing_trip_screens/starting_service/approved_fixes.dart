import 'package:flutter/material.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_cart_provider.dart';
import 'package:mechanic_app/provider/upcoming_mechanic_service/mechanic_request_provider.dart';
import 'package:provider/provider.dart';

class ApprovedFixes extends StatelessWidget {
  const ApprovedFixes({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController controller = ScrollController();
    return Consumer<MechanicServicesCartProvider>(
      builder: (context, mechanicServicesCartProvider, child) => Container(
        height: size.height * 0.9,
        child: SingleChildScrollView(
          controller: controller,
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              mechanicServicesCartProvider.mechanicServicesSelectedList.length >
                      0
                  ? buildCustomerServices(
                      context, size, mechanicServicesCartProvider, controller)
                  : Container(),
              mechanicServicesCartProvider.mechanicItemsSelectedList.length > 0
                  ? buildCustomerItems(
                      context, size, mechanicServicesCartProvider, controller)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  buildCustomerServices(
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
              "Approved Services",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.7),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              controller: controller,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: mechanicServicesCartProvider
                  .mechanicServicesSelectedList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
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
                        '${mechanicServicesCartProvider.mechanicServicesSelectedList[index].category}',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ),
                  leading: GestureDetector(
                    onTap: () {
                      // mechanicServicesCartProvider.removeFromBreakDownCart(
                      //     mechanicServicesCartProvider
                      //         .breakDownListSelectedItems[index]);
                    },
                    child: Text(
                        '${mechanicServicesCartProvider.mechanicServicesSelectedList[index].expectedFare} EGP'),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Divider(
                      thickness: 1.5,
                    ));
              },
            ),
          ),
        ),
      ],
    );
  }

  buildCustomerItems(
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
              "Approved Items",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.7),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              controller: controller,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount:
                  mechanicServicesCartProvider.mechanicItemsSelectedList.length,
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
                      '${mechanicServicesCartProvider.mechanicItemsSelectedList[index].itemDesc}',
                      style: Theme.of(context).textTheme.bodyText2,
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
                  leading: GestureDetector(
                    child: Text(
                        '${mechanicServicesCartProvider.mechanicItemsSelectedList[index].price} EGP'),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Divider(
                      thickness: 1.5,
                    ));
              },
            ),
          ),
        ),
      ],
    );
  }
}
