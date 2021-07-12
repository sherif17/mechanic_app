import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_app/widgets/divider.dart';

class DetailsTab extends StatefulWidget {

  @override
  _DetailsTabState createState() => _DetailsTabState();
}

class _DetailsTabState extends State<DetailsTab> {
  @override
  Widget build(BuildContext context) {
    String customerFirstName = 'first last';
    String customerCarBrand = 'seat';
    String customerCarModel = 'Ibiza';
    String customerCarProductionYear = '2019';
    DateTime now = DateTime.now();

    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                  'Customer name:',
                                  style: Theme.of(context).textTheme.headline2
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                    customerFirstName,
                                    style: Theme.of(context).textTheme.bodyText2
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    DividerWidget(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0, right: 20.0),
                      child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                    'Trip start time:',
                                    style: Theme.of(context).textTheme.headline2
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 60.0),
                                  child: Text(
                                      '${now.hour}:${now.minute}',
                                      style: Theme.of(context).textTheme.bodyText2
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, right: 220.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                                'Car Details:',
                                style: Theme.of(context).textTheme.headline5
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: Container(
                          decoration: BoxDecoration(
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                    'Brand',
                                    style: Theme.of(context).textTheme.headline2
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 120.0),
                                  child: Text(
                                      customerCarBrand,
                                      style: Theme.of(context).textTheme.bodyText2
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    DividerWidget(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                    'Model',
                                    style: Theme.of(context).textTheme.headline2
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 120.0),
                                  child: Text(
                                      customerCarModel,
                                      style: Theme.of(context).textTheme.bodyText2
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    DividerWidget(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 80.0),
                      child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                    'Production Year',
                                    style: Theme.of(context).textTheme.headline2
                                ),
                                Text(
                                    '${now.year} ',
                                    style: Theme.of(context).textTheme.bodyText2
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
