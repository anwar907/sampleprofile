class UsersModel {
  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;
  final String? token;
  final num? age;
  final String? phone;
  final String? birthday;
  final String? university;
  final num? height;
  final num? weight;
  final String? ip;
  final String? domain;
  final String? macAddress;
  final String? userAgent;

  UsersModel({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.token,
    this.age,
    this.phone,
    this.birthday,
    this.university,
    this.height,
    this.weight,
    this.ip,
    this.domain,
    this.macAddress,
    this.userAgent,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        image: json["image"],
        token: json["token"],
        age: json["age"],
        phone: json["phone"],
        birthday: json["birthDate"],
        university: json["university"],
        height: json["height"],
        weight: json["weight"],
        ip: json["ip"],
        domain: json["domain"],
        macAddress: json["macAddress"],
        userAgent: json["userAgent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
        "token": token,
        "age": age,
        "phone": phone,
        "birthDate": birthday,
        "university": university,
        "height": height,
        "weight": weight,
        "ip": ip,
        "domain": domain,
        "macAddress": macAddress,
        "userAgent": userAgent,
      };
}
