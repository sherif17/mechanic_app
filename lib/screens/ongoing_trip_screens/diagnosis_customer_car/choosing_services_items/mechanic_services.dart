import 'package:flutter/material.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_cart_provider.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_provider.dart';
import 'package:mechanic_app/widgets/divider.dart';
import 'package:provider/provider.dart';

class MechanicService extends StatelessWidget {
  MechanicService({key}) : super(key: key);
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    String currentLang = loadCurrentLangFromDB();
    Size size = MediaQuery.of(context).size;
    return Consumer2<MechanicServiceProvider, MechanicServicesCartProvider>(
      builder: (context, mechanicServiceProvider, mechanicServicesCartProvider,
          child) {
        return ListView.separated(
          shrinkWrap: true,
          controller: controller,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: mechanicServiceProvider.mechanicServicesMap.keys.length,
          itemBuilder: (BuildContext context, int index) {
            //print(mechanicServiceProvider.onItemTapList.length);
            return ListTile(
              onTap: () {
                // print(
                //     "Number of subProblems ${mechanicServiceProvider.convertedListOfCategoryValues[mechanicServiceProvider.selectedIndex].values.elementAt(index).length}");
                buildAddToServiceCartBottomSheet(
                    context,
                    size,
                    index,
                    mechanicServiceProvider,
                    currentLang,
                    mechanicServicesCartProvider);
              },
              title: Align(
                alignment: currentLang == "en"
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    //'${mechanicServiceProvider.onItemTapList[mechanicServiceProvider.selectedIndex][index].problem}',
                    '${mechanicServiceProvider.mechanicServicesMap.keys.toList().elementAt(index)}',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
              subtitle: Align(
                alignment: currentLang == "en"
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: Text(
                  (mechanicServiceProvider.mechanicServicesMap.values
                              .elementAt(index)
                              .length !=
                          null)
                      ? 'يحتوي علي عدد ${mechanicServiceProvider.mechanicServicesMap.values.elementAt(index).length} خدمه '
                      : mechanicServiceProvider.mechanicServicesMap.values
                                  .elementAt(index)
                                  .length >
                              0
                          ? 'يحتوي علي عدد ${mechanicServiceProvider.mechanicServicesMap.values.elementAt(index).length} خدمه '
                          : "لا يحتوي علي خدمات ",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              leading: Icon(Icons.arrow_back_ios),
            );
          },
          separatorBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Divider(
                  thickness: 1.5,
                ));
          },
        );
      },
    );
  }

  buildAddToServiceCartBottomSheet(
      BuildContext context,
      Size size,
      int selectedServiceIndex,
      MechanicServiceProvider mechanicServiceProvider,
      String currentLang,
      MechanicServicesCartProvider mechanicServicesCartProvider) {
    return showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        int subServiceIndex = 0;
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: mechanicServiceProvider.mechanicServicesMap.values
                            .elementAt(selectedServiceIndex)
                            .length >
                        1
                    ? size.height * 0.9
                    : size.height * 0.5,
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: mechanicServiceProvider.mechanicServicesMap.values
                            .elementAt(selectedServiceIndex)
                            .length >
                        1
                    ? buildHaveMoreThanOneServiceContainer(
                        context: context,
                        mechanicServiceProvider: mechanicServiceProvider,
                        currentLang: currentLang,
                        setState: setState,
                        selectedServiceIndex: selectedServiceIndex,
                        size: size,
                        subServiceIndex: subServiceIndex)
                    : //Center(child: Text("Hi")),
                    buildHaveOneServiceContainer(
                        context: context,
                        size: size,
                        currentLang: currentLang,
                        mechanicServiceProvider: mechanicServiceProvider,
                        subServiceIndex: subServiceIndex,
                        selectedServiceIndex: selectedServiceIndex,
                        mechanicServicesCartProvider:
                            mechanicServicesCartProvider),
              ),
              mechanicServiceProvider.mechanicServicesMap.values
                          .elementAt(selectedServiceIndex)
                          .length >
                      1
                  ? Container(
                      width: size.width,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 15.0,
                              offset: Offset(0.1, 0.0))
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextButton(
                            child: Text("Add to selected Cart ",
                                style: TextStyle(fontSize: 20)),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(15)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColorLight),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                    )
                  : Container(),
            ],
          );
        });
      },
    );
  }

  buildHaveMoreThanOneServiceContainer(
      {BuildContext context,
      MechanicServiceProvider mechanicServiceProvider,
      String currentLang,
      StateSetter setState,
      int selectedServiceIndex,
      Size size,
      int subServiceIndex}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //     height: MediaQuery.of(context).size.width * 0.05),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_drop_down_circle_rounded,
                        size: 45,
                        color: Colors.grey.withOpacity(0.4),
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                      mechanicServiceProvider.mechanicServicesMap.values
                          .elementAt(selectedServiceIndex)[subServiceIndex]
                          .category,
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                      //" please select services",
                      " برجاء اختيار خدمه من ${mechanicServiceProvider.mechanicServicesMap.values.elementAt(selectedServiceIndex)[subServiceIndex].category}الذي يحتاجها العميل ",
                      style: Theme.of(context).textTheme.bodyText2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
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
                  itemCount: mechanicServiceProvider.mechanicServicesMap.values
                      .elementAt(selectedServiceIndex)
                      .length,
                  itemBuilder: (BuildContext context, subProblemIndex) {
                    //print(mechanicServiceProvider.onItemTapList.length);
                    return CheckboxListTile(
                      value:
                          mechanicServiceProvider.getSubServicesSelectionState(
                              serviceIndex: selectedServiceIndex,
                              subServiceIndex: subProblemIndex),
                      checkColor: Colors.white,
                      activeColor: Colors.blueGrey,
                      selectedTileColor: Colors.greenAccent,
                      title: Align(
                        alignment: currentLang == "en"
                            ? Alignment.topRight
                            : Alignment.topLeft,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            //'${mechanicServiceProvider.onItemTapList[mechanicServiceProvider.selectedIndex][index].problem}',
                            '${mechanicServiceProvider.mechanicServicesMap.values.elementAt(selectedServiceIndex)[subProblemIndex].serviceDesc ?? "لا اعرف - سيتم اختيار المشكله بوجه عام-"}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                      subtitle: Align(
                        alignment: currentLang == "en"
                            ? Alignment.topRight
                            : Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                //'${mechanicServiceProvider.onItemTapList[mechanicServiceProvider.selectedIndex][index].problem}',
                                '${mechanicServiceProvider.mechanicServicesMap.values.elementAt(selectedServiceIndex)[subProblemIndex].expectedFare} EGP',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Text("الاجره المتوقعه"),
                          ],
                        ),
                      ),
                      onChanged: (bool val) {
                        mechanicServiceProvider.onChangeServiceSelectionState(
                            val: val,
                            serviceIndex: selectedServiceIndex,
                            subServiceIndex: subProblemIndex,
                            context: context);
                        setState(() {});
                      },
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
            )
          ],
        ),
      ),
    );
  }

  buildHaveOneServiceContainer(
      {BuildContext context,
      Size size,
      String currentLang,
      MechanicServiceProvider mechanicServiceProvider,
      int subServiceIndex,
      int selectedServiceIndex,
      MechanicServicesCartProvider mechanicServicesCartProvider}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(size.height * 0.01),
                child: Icon(
                  Icons.cancel,
                  size: size.width * 0.1,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            )),
        Align(
          alignment:
              currentLang == "en" ? Alignment.topRight : Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(
                '${mechanicServiceProvider.mechanicServicesMap.values.elementAt(selectedServiceIndex)[subServiceIndex].serviceDesc}',
                style: Theme.of(context).textTheme.headline1,
              ),
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Expected Fare",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${mechanicServiceProvider.mechanicServicesMap.values.elementAt(selectedServiceIndex)[subServiceIndex].expectedFare}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Category",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${mechanicServiceProvider.mechanicServicesMap.values.elementAt(selectedServiceIndex)[subServiceIndex].category}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextButton(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add To Selected Cart",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors
                                .white) //Theme.of(context).textTheme.headline2,
                        ),
                    //SizedBox(width: size.width*0.02),
                    Text(
                        "${mechanicServiceProvider.mechanicServicesMap.values.elementAt(selectedServiceIndex)[subServiceIndex].expectedFare} EGP",
                        //"Visit Fare : ${mechanicServicesCartProvider.visitFare} EGP",
                        style: TextStyle(fontSize: 16, color: Colors.white))
                  ]),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueGrey),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColorLight),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(width: 1.5, color: Colors.white)))),
              onPressed: () {
                mechanicServicesCartProvider.addToMechanicServicesCart(
                    mechanicServiceProvider.mechanicServicesMap.values
                        .elementAt(selectedServiceIndex)[subServiceIndex]);
                Navigator.pop(context);
              }),
        ),
      ],
    );
  }
}
