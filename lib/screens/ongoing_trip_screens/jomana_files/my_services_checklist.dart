import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_app/provider/appControlProvider.dart';
import 'package:provider/provider.dart';

class ServicesChecklist extends StatefulWidget {
  ServicesChecklist({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ServicesChecklistState createState() => _ServicesChecklistState();
}

class _ServicesChecklistState extends State<ServicesChecklist> {
  @override
  // List _doneServices = [];
  //
  // void _onServiceSelected(bool selected, service_id) {
  //   if (selected == true) {
  //     setState(() {
  //       _doneServices.add(service_id);
  //       if(_doneServices.length == _services.length)
  //         {
  //             print("all selected");
  //             print("_doneServices length =  ${_doneServices.length}");
  //             print("_Services length =  ${_services.length}");
  //
  //         }
  //     });
  //   } else {
  //     setState(() {
  //       _doneServices.remove(service_id);
  //     });
  //   }
  // }

  String result = '';
  TextEditingController textController = new TextEditingController();
  String text = '';

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    String _inputtext;
    TextEditingController inputTextField = TextEditingController();
    List<bool> checked = [false, false, false, false];

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
                            itemCount: val.services.length,
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
                                      title: Text(val.services[index]),
                                      activeColor: Theme.of(context).primaryColorDark,
                                      value: val.checked[index],
                                      onChanged: (bool selected) {
                                        (selected)? val.checkThisBox(index) : val.uncheckThisBox(index);
                                        // _onServiceSelected(
                                        //     selected, _services['responseBody'][index]['service_id']);
                                      },
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
                                onTap: () {
                                  val.addNewService(inputTextField.text);
                                  inputTextField.clear();
                                  val.updateAddServiceButtonState(true);
                                },
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
