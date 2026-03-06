class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  final int id;
  final String name;
  final String email;
  final String phone;
  final String password;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json["email"],
      phone: json['phone'],
      password: json['password'],
    );
  }
}
