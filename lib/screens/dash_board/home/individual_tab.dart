import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_app/models/service_request.dart';
import 'package:mechanic_app/screens/dash_board/home/requestTile.dart';
import 'package:mechanic_app/screens/dash_board/home/upComingRequestCard.dart';

class IndividualTab extends StatefulWidget {
   final List<ServiceRequest> serviceRequestsList;

   const IndividualTab ({ Key key, this.serviceRequestsList }): super(key: key);


  @override
  _IndividualTabState createState() => _IndividualTabState();
}

class _IndividualTabState extends State<IndividualTab>
    with AutomaticKeepAliveClientMixin<IndividualTab>{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Container(
              width: 400.0,
              height: 290.0,
              child: UpComingRequestCard(),
            ),
          ),

          (widget.serviceRequestsList.length > 0)
              ? Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Repair Request',
                      style: Theme.of(context).textTheme.headline2
                  ),
                ),
                ListView.separated(
                  padding: EdgeInsets.all(0.0),
                  itemBuilder: (context, index) {
                    return RequestTile(
                      serviceRequest: widget.serviceRequestsList[index],
                      //currentLang: currentLang,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(),
                  itemCount: widget.serviceRequestsList.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                ),
              ],
            ),
          )
              : Container(),
          SizedBox(height: 24.0),

        ],
      ),
    );
  }

}
