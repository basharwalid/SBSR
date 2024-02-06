class UserModel {
  String id;
  String email;
  String name;
  String phone;
  String password;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.password});

  factory UserModel.fromFirestore(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"]);

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    };
  }
}
