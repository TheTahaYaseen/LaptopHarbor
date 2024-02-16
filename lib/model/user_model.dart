class User {
  final String userId;
  final String username;
  final String email;
  final String password;

  User(
      {required this.userId,
      required this.username,
      required this.email,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
    );
  }
}
