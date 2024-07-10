class UserModel {
final int id;
final String? email;
late final String? password;
late final String? username;
UserModel({required this.id, this.email, this.password,this.username});


factory UserModel.fromJson(dynamic data) {
  return UserModel(
    id: data['id'],
    username: data['user_name'] ?? "",
  );
}

Map<String, Object?> toJson() {
  return {
    'id': id,
    'user_name': username,
    'email': email,
  };
}

}