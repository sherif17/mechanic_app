import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class checklist extends StatefulWidget {
  checklist({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _checklistState createState() => _checklistState();
}

class _checklistState extends State<checklist> {
  @override
  List _selecteCategorys = List();
  Map<String, dynamic> _categories = {
    "responseBody": [
      {"category_id": "5", "category_name": "Tiro"},
      {"category_id": "3", "category_name": "Fuel"},
      {"category_id": "7", "category_name": "Check Motor"},
      {"category_id": "8", "category_name": "Oil"}
    ],
    "responseTotalResult": 4 // Total result is 3 here becasue we have 3 categories in responseBody.
  };
  void _onCategorySelected(bool selected, category_id) {
    if (selected == true) {
      setState(() {
        _selecteCategorys.add(category_id);
      });
    } else {
      setState(() {
        _selecteCategorys.remove(category_id);
      });
    }
  }

  String result = '';
  TextEditingController textController = new TextEditingController();
  String text = '';

  Widget build(BuildContext context) {
    String _inputtext;
    TextEditingController inputtextField = TextEditingController();
    void _processText() {
      setState(() {
        _inputtext = inputtextField.text;
      });
    }

    Map<String, dynamic> items = {};
    final TextEditingController eCtrl = new TextEditingController();
    return MaterialApp(
      home: Scaffold(
        body: Column(
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
                          itemCount: _categories['responseTotalResult'],
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue[100],
                                ),
                              ),
                              child: CheckboxListTile(
                                value: _selecteCategorys
                                    .contains(_categories['responseBody'][index]['category_id']),
                                onChanged: (bool selected) {
                                  _onCategorySelected(
                                      selected, _categories['responseBody'][index]['category_id']);
                                },
                                title: Text(_categories['responseBody'][index]['category_name']),
                              ),
                            );
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      child: TextField(
                        controller: inputtextField,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Enter some text'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 180.0),
                    child: Container(
                        width: 80.0,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              _inputtext = inputtextField.text;
                            });
                          },
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Icon(
                            Icons.add,
                            size: 18,
                          ),
                          padding: EdgeInsets.all(16),
                          shape: CircleBorder(),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
