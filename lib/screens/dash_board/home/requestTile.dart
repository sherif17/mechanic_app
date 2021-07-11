import 'package:mechanic_app/models/service_request.dart';
import 'package:flutter/material.dart';

class RequestTile extends StatelessWidget {
  final ServiceRequest serviceRequest;
  //String currentLang;
  RequestTile({
    Key key,
    this.serviceRequest, //this.currentLang
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // show more details
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.008),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black26,
            ),
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 90.0),
                    child: Text(serviceRequest.carNumber,
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                  Text(
                      '${serviceRequest.time.day}/${serviceRequest.time.month}/${serviceRequest.time.year}  ${serviceRequest.time.hour}:${serviceRequest.time.minute}',
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              )),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 300.0,
                    height: 40.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: serviceRequest.requestedServices.length,
                        itemBuilder: (BuildContext txt, int index) {
                          return Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                              ),
                              child: (index ==
                                      serviceRequest.requestedServices.length -
                                          1)
                                  ? Text(
                                      serviceRequest.requestedServices[index],
                                      style:
                                          Theme.of(context).textTheme.headline2)
                                  : Text(
                                      '${serviceRequest.requestedServices[index]}, ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2));
                        }),
                  ),
                ],
              )),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.location_pin,
                      size: 25.0,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      width: 210,
                      height: 20,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Text(serviceRequest.requestLocation,
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(serviceRequest.carType,
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
