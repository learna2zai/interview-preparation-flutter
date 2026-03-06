class RegisterRequestModel {
  late String name;
  late String email;
  late String phone;
  late String password;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    return data;
  }
}
