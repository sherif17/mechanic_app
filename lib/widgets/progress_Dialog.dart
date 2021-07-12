import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  
  String message;
  ProgressDialog({this.message});
  
  @override
  Widget build(BuildContext context) 
  {
    return Dialog(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      child: Container(
        margin: EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(width: 6.0,),
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),),
              SizedBox(width: 26.0,),
              Text(
                message,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        
      ),

    );
  }
}
