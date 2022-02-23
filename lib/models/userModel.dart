class UserModel {
  String? email;
  String? name;
  String? phone;
  String? age;
  String? uId;

  UserModel({
    this.email,
    this.name,
    this.phone,
    this.age,
    this.uId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    age = json['age'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'age': age,
      'uId': uId,
    };
  }
}
