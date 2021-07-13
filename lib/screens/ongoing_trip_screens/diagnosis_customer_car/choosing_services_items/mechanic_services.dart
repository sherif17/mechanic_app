import 'package:flutter/material.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_cart_provider.dart';
import 'package:mechanic_app/provider/mechanic_service/mechanic_service_provider.dart';
import 'package:provider/provider.dart';

class MechanicService extends StatelessWidget {
  MechanicService({key}) : super(key: key);
  ScrollController controller = ScrollController();
  String currentLang = loadJwtTokenFromDB();
  @override
  Widget build(BuildContext context) {
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
                // buildAddToCartBottomSheet(
                //     context,
                //     size,
                //     index,
                //     mechanicServiceProvider,
                //     currentLang,
                //     mechanicServicesCartProvider,
                //     mechanicServiceProvider.convertedListOfCategoryValues);
              },
              title: Align(
                alignment: currentLang == "en"
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    //'${mechanicServiceProvider.onItemTapList[mechanicServiceProvider.selectedIndex][index].problem}',
                    '${mechanicServiceProvider.mechanicServicesMap.keys.toList()[index]}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              // subtitle: Align(
              //   alignment: currentLang == "en"
              //       ? Alignment.topRight
              //       : Alignment.topLeft,
              //   child: Text(
              //     mechanicServiceProvider
              //             .convertedListOfCategoryValues[
              //                 mechanicServiceProvider.selectedIndex]
              //             .values
              //             .elementAt(index)
              //             .every((element) => element.subproblem != null)
              //         ? 'يحتوي علي عدد ${mechanicServiceProvider.convertedListOfCategoryValues[mechanicServiceProvider.selectedIndex].values.elementAt(index).length} مشاكل فرعيه '
              //         : mechanicServiceProvider
              //                     .convertedListOfCategoryValues[
              //                         mechanicServiceProvider.selectedIndex]
              //                     .values
              //                     .elementAt(index)
              //                     .where(
              //                         (element) => element.subproblem != null)
              //                     .length >
              //                 0
              //             ? 'يحتوي علي عدد ${mechanicServiceProvider.convertedListOfCategoryValues[mechanicServiceProvider.selectedIndex].values.elementAt(index).where((element) => element.subproblem != null).length} مشاكل فرعيه '
              //             : "لا يحتوي علي مشاكل فرعيه",
              //     style: Theme.of(context).textTheme.headline5,
              //   ),
              // ),
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
}
