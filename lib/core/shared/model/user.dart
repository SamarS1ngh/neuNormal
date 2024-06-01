class User {
  String name;
  String password;
  List<String> interests;

  User({required this.interests, required this.name, required this.password});

  factory User.fromMap(Map<String, dynamic> mp) {
    return User(
      interests: List<String>.from(mp["interests"]),
      name: mp["name"],
      password: mp["password"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "password": password,
      "interests": interests,
    };
  }
}
