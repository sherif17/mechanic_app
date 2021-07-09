import 'package:flutter/material.dart';
import 'package:mechanic_app/lang/language_list.dart';
import 'package:mechanic_app/local_db/mechanic_info_db.dart';
import 'package:mechanic_app/localization/localization_constants.dart';
import 'package:mechanic_app/shared_prefrences/winch_user_model.dart';
import 'package:mechanic_app/utils/size_config.dart';

import '../../../main.dart';
import '../../../main.dart';
import 'intro_body.dart';

class Intro extends StatefulWidget {
  static String routeName = '/intro';
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildLangDropdown(),
          ),
        ],
      ),
      body: IntroBody(),
    );
  }

  DropdownButton<Language> buildLangDropdown() {
    return DropdownButton(
      underline: SizedBox(),
      icon: Icon(
        Icons.language,
        color: Colors.redAccent,
      ),
      onChanged: (Language language) async {
        _changeLanguage(language);
        print("current lang: ${loadCurrentLangFromDB()}");
      },
      items: Language.languageList()
          .map<DropdownMenuItem<Language>>(
            (lang) => DropdownMenuItem(
              value: lang,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    lang.flag,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(lang.name)
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
