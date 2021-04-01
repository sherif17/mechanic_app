import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:mechanic_app/models/files_upload_model.dart';
import 'dart:convert';

import 'package:mechanic_app/models/phone_num_model.dart';
import 'package:mechanic_app/models/user_register_model.dart';

class ApiService {
  static const String baseUrl = 'http://161.97.155.244/api/';

  Future<PhoneResponseModel> phoneCheck(
      PhoneRequestModel phoneRequestModel) async {
    var url = Uri.parse(baseUrl + 'registeration/mechanicUser');
    final response = await http.post(url,
        headers: {'charset': 'utf-8'}, body: phoneRequestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      print("response.body:${response.body}");
      return PhoneResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("failed to load Data");
    }
  }

  Future<WinchRegisterResponseModel> registerUser(
      WinchRegisterRequestModel userRegisterRequestModel, token, lang) async {
    var url = Uri.parse(baseUrl + 'mechanic/me/updateprofile');
    final response = await http.post(url,
        headers: {"x-auth-token": "$token", 'language': "$lang"},
        body: userRegisterRequestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      print("response.body:${response.body}");
      return WinchRegisterResponseModel.fromJson(json.decode(response.body));
    }
  }

  Future<FilesUploadResponseModel> uploadImage({dynamic data, token}) async {
    Response response;
    Dio dio = new Dio();
    // dio.options.headers['content-Type'] = 'application/json';
    //dio.options.headers["x-auth-token"] = "$token";
    String url = 'http://161.97.155.244/api/winchDriver/me/UploadImages';
    response = await dio.post(url,
        data: data,
        options: Options(
          headers: {"x-auth-token": token},
        ), onSendProgress: (int sent, int total) {
      print("$sent $total");
    }).whenComplete(() {
      print("complete:");
      //print(response.data);
      // return FilesUploadResponseModel.fromJson(json.decode(response.data));
    }).catchError((onError) {
      print("error:${onError.toString()}");
    });
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return FilesUploadResponseModel.fromJson(json.decode(response.data));
    } else {
      throw Exception("failed to load Data");
    }
  }
}
/*
Future<FilesUploadResponseModel> uploadImage({FormData data, token}) async {
  String url = 'http://161.97.155.244/api/winchDriver/me/UploadImages';
  Response response;
  Dio dio = new Dio();
  response = await dio.post(url,
      data: data,
      options: Options(
        headers: {"x-auth-token": token},
      ));
  print(response.data);
  if (response.statusCode == 200 || response.statusCode == 400) {
    return FilesUploadResponseModel.fromJson(json.decode(response.data));
  } else {
    throw Exception("failed to load Data");
  }
}
*/
/*
  Future<FilesUploadResponseModel> uploadImage({List imgList, token}) async {
    String url = 'http://161.97.155.244/api/winchDriver/me/UploadImages';
    var headers = {'x-auth-token': token};
    var request = http.MultipartRequest('POST', Uri.parse(url));
    for (int i = 0; i < imgList.length; i++) {
      request.files
          .add(await http.MultipartFile.fromPath('DriverImages', imgList[i]));
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return FilesUploadResponseModel.fromJson(
          json.decode(await response.stream.bytesToString()));
    } else {
      print(response.reasonPhrase);
    }
  }
}
*/
/*
var dio = Dio();
var response = await dio.post(
url,
data: data,
options: Options(
headers: {"x-auth-token": token},
),
onSendProgress: (int sent, int total) {
print("sent${sent.toString()}" + " total${total.toString()}");
},
).whenComplete(() {
print("complete:");
}).catchError((onError) {
print("error:${onError.toString()}");
});
print(response.data);
 */
