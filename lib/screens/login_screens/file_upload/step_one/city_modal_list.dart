class CityItem {
  int id;
  String city;
  static String lang;

  CityItem(this.id, this.city);
  static List<CityItem> getEngCompanies() {
    //tring lang = 'en';
    return <CityItem>[
      CityItem(1, 'Select city'),
      CityItem(2, 'Ain Sokhna'),
      CityItem(3, 'Alexandria'),
      CityItem(4, 'Asyut'),
      CityItem(5, 'Banha'),
      CityItem(6, 'Beheira'),
      CityItem(7, ' Beni Suef'),
      CityItem(8, 'Damietta'),
      CityItem(9, 'Faiyum'),
      CityItem(10, 'Hurghada'),
      CityItem(11, 'Ismailia'),
      CityItem(12, 'Kafr El Sheikh'),
      CityItem(13, 'Mansoura'),
      CityItem(14, 'Marsa Alam'),
      CityItem(15, 'Matruh'),
      CityItem(16, 'Minya'),
      CityItem(17, 'Monufia'),
      CityItem(18, 'New Valley'),
      CityItem(19, 'North Coast'),
      CityItem(20, 'North Sinai'),
      CityItem(21, 'Port Said'),
    ];
  }

  static List<CityItem> getArabCompanies() {
    //tring lang = 'en';
    return <CityItem>[
      CityItem(1, 'اختر المحافظه'),
      CityItem(2, 'السخنة'),
      CityItem(3, 'الإسكندرية'),
      CityItem(4, 'اسيوط'),
      CityItem(5, 'بنها'),
      CityItem(6, 'البحيرة'),
      CityItem(7, 'بني سويف'),
      CityItem(8, 'دمياط'),
      CityItem(9, 'الفيوم'),
      CityItem(10, 'الغردقة'),
      CityItem(11, 'الاسماعيلية'),
      CityItem(12, ' كفر الشيخ'),
      CityItem(13, 'المنصورة'),
      CityItem(14, 'مرسى علم'),
      CityItem(15, 'مطروح'),
      CityItem(16, 'المنيا'),
      CityItem(17, 'المنوفية'),
      CityItem(18, 'الوادي الجديد'),
      CityItem(19, 'الساحل الشمالي'),
      CityItem(20, 'راس غارب'),
      CityItem(21, 'بورسعيد'),
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
