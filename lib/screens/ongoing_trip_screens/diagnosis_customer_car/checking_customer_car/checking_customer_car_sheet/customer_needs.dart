import 'package:flutter/material.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/provider/upcoming_mechanic_service/mechanic_request_provider.dart';
import 'package:provider/provider.dart';

class CustomerNeeds extends StatefulWidget {
  const CustomerNeeds({key}) : super(key: key);

  @override
  _CustomerNeedsState createState() => _CustomerNeedsState();
}

class _CustomerNeedsState extends State<CustomerNeeds> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController controller = ScrollController();
    return Consumer<MechanicRequestProvider>(
      builder: (context, mechanicRequestProvider, child) => Container(
        height: size.height * 0.9,
        child: SingleChildScrollView(
          controller: controller,
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              buildCustomerProblems(
                  context, size, mechanicRequestProvider, controller),
              buildServicesNeeded(
                  context, size, mechanicRequestProvider, controller),
              //buildPaymentSummery(context, mechanicRequestProvider),
            ],
          ),
        ),
      ),
    );
  }

  buildCustomerProblems(
      BuildContext context,
      Size size,
      MechanicRequestProvider mechanicRequestProvider,
      ScrollController controller) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Customer Problems",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
        // ListView.separated(
        //   shrinkWrap: true,
        //   controller: controller,
        //   physics: const AlwaysScrollableScrollPhysics(),
        //   padding: const EdgeInsets.all(8),
        //   itemCount: mechanicRequestProvider.repairsToBeMadeList_Items.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return ListTile(
        //       title: Align(
        //         alignment: loadCurrentLangFromDB() == "en"
        //             ? Alignment.topRight
        //             : Alignment.topLeft,
        //         child: Text(
        //           '${mechanicRequestProvider.repairsToBeMadeList_Items[index].repairitself.itemDesc}',
        //           style: Theme.of(context).textTheme.bodyText2,
        //         ),
        //       ),
        //       subtitle: Align(
        //         alignment: loadCurrentLangFromDB() == "en"
        //             ? Alignment.topRight
        //             : Alignment.topLeft,
        //         child: FittedBox(
        //           fit: BoxFit.fill,
        //           child: Text(
        //             '${mechanicRequestProvider.repairsToBeMadeList_Items[index].repairitself.category}',
        //             style: Theme.of(context).textTheme.bodyText1,
        //           ),
        //         ),
        //       ),
        //       leading: GestureDetector(
        //         onTap: () {
        //           // mechanicServicesCartProvider.removeFromBreakDownCart(
        //           //     mechanicServicesCartProvider
        //           //         .breakDownListSelectedItems[index]);
        //         },
        //         child: Text(
        //             '${mechanicRequestProvider.repairsToBeMadeList_Items[index].repairitself.price} EGP'),
        //       ),
        //     );
        //   },
        //   separatorBuilder: (context, index) {
        //     return Padding(
        //         padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        //         child: Divider(
        //           thickness: 1.5,
        //         ));
        //   },
        // ),
      ],
    );
  }

  buildServicesNeeded(
      BuildContext context,
      Size size,
      MechanicRequestProvider mechanicRequestProvider,
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
        // ListView.separated(
        //   shrinkWrap: true,
        //   controller: controller,
        //   physics: const AlwaysScrollableScrollPhysics(),
        //   padding: const EdgeInsets.all(8),
        //   itemCount:
        //       mechanicRequestProvider.repairsToBeMadeList_Services.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return ListTile(
        //       // onTap: () {
        //       //   buildAddToCartBottomSheet(
        //       //       context,
        //       //       size,
        //       //       index,
        //       //       mechanicServiceProvider,
        //       //       currentLang,
        //       //       mechanicServicesCartProvider);
        //       // },
        //       title: Align(
        //         alignment: loadCurrentLangFromDB() == "en"
        //             ? Alignment.topRight
        //             : Alignment.topLeft,
        //         child: Text(
        //           '${mechanicRequestProvider.repairsToBeMadeList_Services[index].repairitself.serviceDesc}',
        //           style: Theme.of(context).textTheme.bodyText2,
        //         ),
        //       ),
        //       subtitle: Align(
        //         alignment: loadCurrentLangFromDB() == "en"
        //             ? Alignment.topRight
        //             : Alignment.topLeft,
        //         child: FittedBox(
        //           fit: BoxFit.fill,
        //           child: Text(
        //             '${mechanicRequestProvider.repairsToBeMadeList_Services[index].repairitself.category}',
        //             style: Theme.of(context).textTheme.bodyText1,
        //           ),
        //         ),
        //       ),
        //       leading: GestureDetector(
        //         child: Text(
        //             '${mechanicRequestProvider.repairsToBeMadeList_Services[index].repairitself.expectedFare} EGP'),
        //       ),
        //     );
        //   },
        //   separatorBuilder: (context, index) {
        //     return Padding(
        //         padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        //         child: Divider(
        //           thickness: 1.5,
        //         ));
        //   },
        // ),
      ],
    );
  }
}
