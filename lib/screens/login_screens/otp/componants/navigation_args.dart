class otpNavData {
  String jwtToken;
  String uID;
  String FName;
  String LName;
  String Phone;
  dynamic socialPhoto;
  dynamic socialEmail;
  String loginType;
  String iAt;

  otpNavData(
      {this.jwtToken,
      this.uID,
      this.FName,
      this.LName,
      this.iAt,
      this.Phone,
      this.socialEmail,
      this.socialPhoto});
}
