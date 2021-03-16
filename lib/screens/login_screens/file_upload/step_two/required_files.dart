import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mechanic_app/localization/localization_constants.dart';
import 'package:path/path.dart';

class RequiredFiles extends StatefulWidget {
  File personalPhoto;
  File driverLicense;
  File winchLicenseFront;
  File winchLicenseBack;
  File criminalRecord;
  File drugsAnalysis;
  File winchCheckReport;
  List<String> filesList = List<String>();
  List<String> filesPathList = List<String>();
  RequiredFiles(
      {this.filesList,
      this.filesPathList,
      this.personalPhoto,
      this.driverLicense,
      this.winchLicenseFront,
      this.winchLicenseBack,
      this.criminalRecord,
      this.drugsAnalysis,
      this.winchCheckReport});

  @override
  _RequiredFilesState createState() => _RequiredFilesState();
}

class _RequiredFilesState extends State<RequiredFiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                bottom: MediaQuery.of(context).size.height * 0.03),
            child: Text(
              getTranslated(context, "Upload Required Files"),
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          BuildFileUpload(
              context,
              getTranslated(context, 'Personal Photo'),
              getTranslated(context, "Please upload clear photo for you"),
              "assets/icons/profile.png",
              true,
              widget.personalPhoto,
              1),
          /* BuildFileUpload(
              context,
              'Driver License',
              "Please upload your licence ",
              "assets/icons/profile.png",
              true,
              widget.driverLicense,
              2),
          BuildFileUpload(
              context,
              'Winch License : Front',
              "upload your winch licence,front image",
              "assets/icons/profile.png",
              true,
              widget.winchLicenseFront,
              3),
          BuildFileUpload(
              context,
              'Winch License : Back ',
              "upload your winch licence,back image",
              "assets/icons/profile.png",
              true,
              widget.winchLicenseBack,
              4),
          BuildFileUpload(
              context,
              'Criminal Record',
              "upload Criminal record about you",
              "assets/icons/profile.png",
              true,
              widget.criminalRecord,
              5),
          BuildFileUpload(
              context,
              'Drugs Analysis',
              "upload Drug analysis report form X Laboratory",
              "assets/icons/profile.png",
              true,
              widget.drugsAnalysis,
              6),
          BuildFileUpload(
              context,
              'Winch Check Report',
              "upload your winch check Report,from X Center",
              "assets/icons/profile.png",
              true,
              widget.winchCheckReport,
              7),*/
        ],
      ),
    );
  }

  Card BuildFileUpload(
      context, title, content, imgSrc, isExpanded, File fileType, int index) {
    return Card(
      elevation: 0,
      semanticContainer: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Theme.of(context).primaryColorDark),
          gapPadding: 100),
      borderOnForeground: true,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.01,
      ),
      child: ExpansionTile(
        title: Text(title, style: Theme.of(context).textTheme.headline2),
        backgroundColor: Theme.of(context).accentColor,
        //trailing: Icon(x ? Icons.copyright_rounded : Icons.height),
        children: [
          Container(
            color: Theme.of(context).accentColor,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.04,
                                right:
                                    MediaQuery.of(context).size.width * 0.04),
                            child: Text(
                              content,
                              style: TextStyle(
                                  color: Colors.deepOrangeAccent, fontSize: 17),
                            ))),
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.all(8),
                            child: fileType == null
                                ? Image.asset(imgSrc)
                                : Image.file(fileType)))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.25),
                  child: FlatButton(
                    height: MediaQuery.of(context).size.height *
                        0.05, //minWidth: MediaQuery.of(context).size.width * 0.05,
                    color: Theme.of(context).primaryColorDark,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(getTranslated(context, "Upload")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03),
                        SvgPicture.asset(
                          "assets/icons/upload-cloud.svg",
                          color: Theme.of(context).accentColor,
                          width: MediaQuery.of(context).size.width * 0.035,
                          height: MediaQuery.of(context).size.height * 0.03,
                        )
                      ],
                    ),
                    onPressed: () {
                      if (fileType == widget.personalPhoto && index == 1)
                        pickPersonalPhoto();
                      if (fileType == widget.driverLicense && index == 2)
                        pickDriverLicense();
                      if (fileType == widget.winchLicenseFront && index == 3)
                        pickWinchLicenseFront();
                      if (fileType == widget.winchLicenseBack && index == 4)
                        pickWinchLicenseBack();
                      if (fileType == widget.criminalRecord && index == 5)
                        pickCriminalRecord();
                      if (fileType == widget.drugsAnalysis && index == 6)
                        pickDrugsAnalysis();
                      if (fileType == widget.winchCheckReport && index == 7)
                        pickWinchCheckReport();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future pickPersonalPhoto() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        widget.personalPhoto = File(pickedFile.path);
        String spiltedPersonalPhoto = widget.personalPhoto.path.split("/").last;
        widget.filesList.add(spiltedPersonalPhoto);
        widget.filesPathList.add(widget.personalPhoto.path);
        print(widget.personalPhoto.path);
        print(spiltedPersonalPhoto);
      } else {
        print('No image selected.');
      }
    });
  }

  Future pickDriverLicense() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        widget.driverLicense = File(pickedFile.path);
        String spliltedDriverLicense =
            widget.driverLicense.path.split("/").last;
        widget.filesList.add(spliltedDriverLicense);
        widget.filesPathList.add(widget.driverLicense.path);
        print(widget.driverLicense);
        print(spliltedDriverLicense);
      } else {
        print('No image selected.');
      }
    });
  }

  Future pickWinchLicenseFront() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        widget.winchLicenseFront = File(pickedFile.path);
        String spliltedWinchLicenseFront =
            widget.winchLicenseFront.path.split("/").last;
        widget.filesList.add(spliltedWinchLicenseFront);
        widget.filesPathList.add(widget.winchLicenseFront.path);
        print(widget.winchLicenseFront);
        print(spliltedWinchLicenseFront);
      } else {
        print('No image selected.');
      }
    });
  }

  Future pickWinchLicenseBack() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        widget.winchLicenseBack = File(pickedFile.path);
        String spliltedWinchLicenseBack =
            widget.winchLicenseBack.path.split("/").last;
        widget.filesList.add(spliltedWinchLicenseBack);
        widget.filesPathList.add(widget.winchLicenseBack.path);
        print(widget.winchLicenseBack);
        print(spliltedWinchLicenseBack);
      } else {
        print('No image selected.');
      }
    });
  }

  Future pickCriminalRecord() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        widget.criminalRecord = File(pickedFile.path);
        String spliltedCriminalRecord =
            widget.criminalRecord.path.split("/").last;
        widget.filesList.add(spliltedCriminalRecord);
        widget.filesPathList.add(widget.criminalRecord.path);
        print(widget.criminalRecord);
        print(spliltedCriminalRecord);
      } else {
        print('No image selected.');
      }
    });
  }

  Future pickDrugsAnalysis() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        widget.drugsAnalysis = File(pickedFile.path);
        String spliltedDrugsAnalysis =
            widget.drugsAnalysis.path.split("/").last;
        widget.filesList.add(spliltedDrugsAnalysis);
        widget.filesPathList.add(widget.drugsAnalysis.path);
        print(widget.drugsAnalysis);
        print(spliltedDrugsAnalysis);
      } else {
        print('No image selected.');
      }
    });
  }

  Future pickWinchCheckReport() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        widget.winchCheckReport = File(pickedFile.path);
        String spliltedWinchCheckReport =
            widget.winchCheckReport.path.split("/").last;
        widget.filesList.add(spliltedWinchCheckReport);
        widget.filesPathList.add(widget.winchCheckReport.path);
        print(widget.winchCheckReport);
        print(spliltedWinchCheckReport);
      } else {
        print('No image selected.');
      }
    });
  }
}
