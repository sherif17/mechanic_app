import 'dart:convert';

// To parse this JSON data, do
//
//     final filesUploadResponseModel = filesUploadResponseModelFromJson(jsonString);

FilesUploadResponseModel filesUploadResponseModelFromJson(String str) =>
    FilesUploadResponseModel.fromJson(json.decode(str));

String filesUploadResponseModelToJson(FilesUploadResponseModel data) =>
    json.encode(data.toJson());

class FilesUploadResponseModel {
  FilesUploadResponseModel({
    this.token,
    this.error,
  });

  String token;
  String error;

  factory FilesUploadResponseModel.fromJson(Map<String, dynamic> json) =>
      FilesUploadResponseModel(
        token: json["token"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "error": error,
      };
}
