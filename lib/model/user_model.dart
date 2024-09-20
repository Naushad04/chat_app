class UserModel {
  String? userId;
  String? name;
  String? email;
  String? age;
  String? bio;
  String? address;
  String? maritalStatus;
  String? password;

  UserModel({
    this.userId,
    this.name,
    this.email,
    this.age,
    this.bio,
    this.address,
    this.maritalStatus,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["userId"],
    name: json["name"],
    email: json["email"],
    age: json["age"],
    bio: json["bio"],
    address: json["address"],
    maritalStatus: json["marital status"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "name": name,
    "email": email,
    "age": age,
    "bio": bio,
    "address": address,
    "marital status": maritalStatus,
    "password": password,
  };
}
