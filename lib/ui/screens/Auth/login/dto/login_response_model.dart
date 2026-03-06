class LoginResponseModel {
  String? accessToken;
  String? refreshToken;
  String? expiresIn;

  LoginResponseModel({this.accessToken, this.refreshToken, this.expiresIn});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    expiresIn = json['expiresIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['expiresIn'] = expiresIn;
    return data;
  }
}
