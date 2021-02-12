class CityItem {
  int id;
  String city;
  static String lang;

  CityItem(this.id, this.city);
  static List<CityItem> getCompanies() {
    //tring lang = 'en';
    return <CityItem>[
      CityItem(1, lang == 'en' ? 'Select city' : 'اختر المحافظه'),
      CityItem(2, lang == 'en' ? 'Ain Sokhna' : 'السخنة'),
      CityItem(3, lang == 'en' ? 'Alexandria' : 'الإسكندرية'),
      CityItem(4, lang == 'en' ? 'Asyut' : 'اسيوط'),
      CityItem(5, lang == 'en' ? 'Banha' : 'بنها'),
      CityItem(6, lang == 'en' ? 'Beheira' : 'البحيرة'),
      CityItem(7, lang == 'en' ? ' Beni Suef' : 'بني سويف'),
      CityItem(8, lang == 'en' ? 'Damietta' : 'دمياط'),
      CityItem(9, lang == 'en' ? 'Faiyum' : 'الفيوم'),
      CityItem(10, lang == 'en' ? 'Hurghada' : 'الغردقة'),
      CityItem(11, lang == 'en' ? 'Ismailia' : 'الاسماعيلية'),
      CityItem(12, lang == 'en' ? 'Kafr El Sheikh' : ' كفر الشيخ'),
      CityItem(13, lang == 'en' ? 'Mansoura' : 'المنصورة'),
      CityItem(14, lang == 'en' ? 'Marsa Alam' : 'مرسى علم'),
      CityItem(15, lang == 'en' ? 'Matruh' : 'مطروح'),
      CityItem(16, lang == 'en' ? 'Minya' : 'المنيا'),
      CityItem(17, lang == 'en' ? 'Monufia' : 'المنوفية'),
      CityItem(18, lang == 'en' ? 'New Valley' : 'الوادي الجديد'),
      CityItem(19, lang == 'en' ? 'North Coast' : 'الساحل الشمالي'),
      CityItem(20, lang == 'en' ? 'North Sinai' : 'راس غارب'),
      CityItem(21, lang == 'en' ? 'Port Said' : 'بورسعيد'),
    ];
  }
}

// import 'package:mechanic_app/localization/localization_constants.dart';
//
// class CityItem {
//   int id;
//   String city;
//   static String lang;
//
//   CityItem(this.id, this.city);
//   static List<CityItem> getCompanies(context) {
//     //tring lang = 'en';
//     return <CityItem>[
//       CityItem(1, getTranslated(context, "Select city")),
//       CityItem(2, getTranslated(context, "Ain Sokhna")),
//       CityItem(3, getTranslated(context, "Alexandria")),
//       CityItem(4, getTranslated(context, "Asyut")),
//       CityItem(5, getTranslated(context, "Banha")),
//       CityItem(6, getTranslated(context, "Beheira")),
//       CityItem(7, getTranslated(context, "Beni Suef")),
//       CityItem(8, getTranslated(context, "Damietta")),
//       CityItem(9, getTranslated(context, "Faiyum")),
//       CityItem(10, getTranslated(context, "Hurghada")),
//       CityItem(11, getTranslated(context, "Ismailia")),
//       CityItem(12, getTranslated(context, "Kafr El Sheikh")),
//       CityItem(13, getTranslated(context, "Mansoura")),
//       CityItem(14, getTranslated(context, "Marsa Alam")),
//       CityItem(15, getTranslated(context, "Matruh")),
//       CityItem(16, getTranslated(context, "Minya")),
//       CityItem(17, getTranslated(context, "Monufia")),
//       CityItem(18, getTranslated(context, "New Valley")),
//       CityItem(19, getTranslated(context, "North Coast")),
//       CityItem(20, getTranslated(context, "North Sinai")),
//       CityItem(21, getTranslated(context, "Port Said")),
//     ];
//   }
// }
