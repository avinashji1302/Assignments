class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String companyName;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.companyName,
      required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      companyName: json['company'] != null ? json['company']['name'] ?? '' : '',
      phone: json['phone'],
    );
  }
}
