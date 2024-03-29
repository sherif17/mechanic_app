import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_app/provider/appControlProvider.dart';
import 'package:provider/provider.dart';

class Checklist extends StatefulWidget {
  Checklist({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  @override
  List _doneServices = List();
  Map<String, dynamic> _services = {
    "responseBody": [
      {"service_id": "5", "service_name": "Tire"},
      {"service_id": "3", "service_name": "Fuel"},
      {"service_id": "7", "service_name": "Check Motor"},
      {"service_id": "8", "service_name": "Oil"}
    ],
    "responseTotalResult": 4
  };
  void _onServiceSelected(bool selected, service_id) {
    if (selected == true) {
      setState(() {
        _doneServices.add(service_id);
        if(_doneServices.length == _services.length)
          {
              print("all selected");
              print("_doneServices length =  ${_doneServices.length}");
              print("_Services length =  ${_services.length}");

          }
      });
    } else {
      setState(() {
        _doneServices.remove(service_id);
      });
    }
  }

  String result = '';
  TextEditingController textController = new TextEditingController();
  String text = '';

  Widget build(BuildContext context) {
    String _inputtext;
    TextEditingController inputTextField = TextEditingController();

    Size size = MediaQuery.of(context).size;
    void _processText() {
      setState(() {
        _inputtext = inputTextField.text;
      });
    }

    Map<String, dynamic> items = {};
    final TextEditingController eCtrl = new TextEditingController();
    return Consumer<AppControlProvider>(
        builder: (context, val,
        child) =>MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _services['responseTotalResult'],
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                    ),
                                    child: CheckboxListTile(
                                      activeColor: Theme.of(context).primaryColorDark,
                                      value: _doneServices
                                          .contains(_services['responseBody'][index]['service_id']),
                                      onChanged: (bool selected) {
                                        _onServiceSelected(
                                            selected, _services['responseBody'][index]['service_id']);
                                      },
                                      title: Text(_services['responseBody'][index]['service_name']),


                                    ),
                                  ),
                                  SizedBox(height: 8.0,),
                                ],
                              );
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: (val.addServiceButtonState == false) ?
                      Container(
                        child: Column(
                          children: [
                            TextField(
                              controller: inputTextField,
                              decoration: InputDecoration(
                                 labelText: 'Type extra service',),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                child: Text("Submit", style: Theme.of(context).textTheme.subtitle1),
                              ),
                            ),
                          ],
                        ),
                      ) :
                      Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 180.0),
                      child: Container(
                          width: 80.0,
                          height: 50.0,
                          child: (val.addServiceButtonState == true)?
                          RaisedButton(
                            onPressed: () {
                              // setState(() {
                              //   _inputtext = inputTextField.text;
                              // });
                              val.updateAddServiceButtonState(false);
                            },
                            color: Theme.of(context).primaryColor,
                            textColor: Theme.of(context).accentColor,
                            child: Icon(
                              Icons.add,
                              size: 18,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          ):
                          RaisedButton(
                            onPressed: () {
                              // setState(() {
                              //   _inputtext = inputTextField.text;
                              // });
                              val.updateAddServiceButtonState(true);
                            },
                            color: Colors.redAccent,
                            textColor: Colors.black,
                            child: Icon(
                              Icons.close,
                              size: 18,
                            ),
                            padding: EdgeInsets.all(16),
                            shape: CircleBorder(),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ));
  }
}
