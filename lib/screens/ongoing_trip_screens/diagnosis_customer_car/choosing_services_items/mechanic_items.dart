import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_cart_provider.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_provider.dart';
import 'package:mechanic_app/widgets/divider.dart';
import 'package:provider/provider.dart';

class MechanicItems extends StatelessWidget {
  MechanicItems({key}) : super(key: key);
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
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
          itemCount: mechanicServiceProvider.mechanicItemsMap.keys.length,
          itemBuilder: (BuildContext context, int index) {
            //print(mechanicServiceProvider.onItemTapList.length);
            return ListTile(
              onTap: () {
                // print(
                //     "Number of subProblems ${mechanicServiceProvider.convertedListOfCategoryValues[mechanicServiceProvider.selectedIndex].values.elementAt(index).length}");
                buildAddToCartBottomSheet(
                  context,
                  size,
                  index,
                  mechanicServiceProvider,
                  currentLang,
                  mechanicServicesCartProvider,
                  /*mechanicServiceProvider.convertedListOfCategoryValues*/
                );
              },
              title: Align(
                alignment: currentLang == "en"
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    //'${mechanicServiceProvider.onItemTapList[mechanicServiceProvider.selectedIndex][index].problem}',
                    '${mechanicServiceProvider.mechanicItemsMap.keys.toList()[index]}',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
              subtitle: Align(
                alignment: currentLang == "en"
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: Text(
                  (mechanicServiceProvider.mechanicItemsMap.values
                              .elementAt(index)
                              .length >
                          1)
                      ? 'يحتوي علي عدد ${mechanicServiceProvider.mechanicItemsMap.values.elementAt(index).length} من عناصر '
                      : mechanicServiceProvider.mechanicItemsMap.values
                                  .elementAt(index)
                                  .length ==
                              1
                          ? 'يحتوي علي عنصر واحد '
                          : "لا يحتوي علي عناصر ",
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

  buildAddToCartBottomSheet(
      BuildContext context,
      Size size,
      int selectedItemIndex,
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
        int subItemIndex = 0;
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: mechanicServiceProvider.mechanicItemsMap.values
                            .elementAt(selectedItemIndex)
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
                child: mechanicServiceProvider.mechanicItemsMap.values
                            .elementAt(selectedItemIndex)
                            .length >
                        1
                    ? buildHaveMoreThanOneItemContainer(
                        context: context,
                        mechanicServiceProvider: mechanicServiceProvider,
                        currentLang: currentLang,
                        setState: setState,
                        selectedItemIndex: selectedItemIndex,
                        size: size,
                        subItemIndex: subItemIndex)
                    : //Center(child: Text("Hi")),
                    buildDHaveOneItemContainer(
                        context: context,
                        size: size,
                        currentLang: currentLang,
                        mechanicServiceProvider: mechanicServiceProvider,
                        subItemIndex: subItemIndex,
                        selectedItemIndex: selectedItemIndex,
                        mechanicServicesCartProvider:
                            mechanicServicesCartProvider),
              ),
              mechanicServiceProvider.mechanicItemsMap.values
                          .elementAt(selectedItemIndex)
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

  buildHaveMoreThanOneItemContainer(
      {BuildContext context,
      MechanicServiceProvider mechanicServiceProvider,
      String currentLang,
      StateSetter setState,
      int selectedItemIndex,
      Size size,
      int subItemIndex}) {
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
                      mechanicServiceProvider.mechanicItemsMap.values
                          .elementAt(selectedItemIndex)[subItemIndex]
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
                      " برجاء اختيار عناصر من ${mechanicServiceProvider.mechanicItemsMap.values.elementAt(selectedItemIndex)[subItemIndex].category}الذي يحتاجها العميل ",
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
                  itemCount: mechanicServiceProvider.mechanicItemsMap.values
                      .elementAt(selectedItemIndex)
                      .length,
                  itemBuilder: (BuildContext context, subProblemIndex) {
                    //print(mechanicServiceProvider.onItemTapList.length);
                    return CheckboxListTile(
                      value: mechanicServiceProvider.getSubItemSelectionState(
                          itemIndex: selectedItemIndex,
                          subItemIndex: subProblemIndex),
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
                            '${mechanicServiceProvider.mechanicItemsMap.values.elementAt(selectedItemIndex)[subProblemIndex].itemDesc ?? "لا اعرف - سيتم اختيار المشكله بوجه عام-"}',
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
                                '${mechanicServiceProvider.mechanicItemsMap.values.elementAt(selectedItemIndex)[subProblemIndex].price}',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                            Text("السعر"),
                          ],
                        ),
                      ),
                      onChanged: (bool val) {
                        mechanicServiceProvider.onChangeItemSelectionState(
                            val: val,
                            itemIndex: selectedItemIndex,
                            subItemIndex: subProblemIndex,
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

  buildDHaveOneItemContainer(
      {BuildContext context,
      Size size,
      String currentLang,
      MechanicServiceProvider mechanicServiceProvider,
      int subItemIndex,
      int selectedItemIndex,
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
                '${mechanicServiceProvider.mechanicItemsMap.values.elementAt(selectedItemIndex)[subItemIndex].itemDesc}',
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
                            "Fare",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${mechanicServiceProvider.mechanicItemsMap.values.elementAt(selectedItemIndex)[subItemIndex].price} EGP',
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
                            '${mechanicServiceProvider.mechanicItemsMap.values.elementAt(selectedItemIndex)[subItemIndex].category}',
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
                        "${mechanicServiceProvider.mechanicItemsMap.values.elementAt(selectedItemIndex)[subItemIndex].price} EGP",
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
                mechanicServicesCartProvider.addToMechanicItemCart(
                    mechanicServiceProvider.mechanicItemsMap.values
                        .elementAt(selectedItemIndex)[subItemIndex]);
                Navigator.pop(context);
              }),
        ),
      ],
    );
  }
}
