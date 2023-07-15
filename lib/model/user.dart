class UserModel {
  final String? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? password;
  const UserModel({this.id, this.email, this.name, this.password, this.phone});
  toJson() {
    return {
      "Name": name,
      "Emial": email,
      "Phone": phone,
      "Password": password,
    };
  }
}
