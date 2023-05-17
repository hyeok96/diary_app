class ProfileModel {
  String email;

  ProfileModel({required this.email});

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(email: map["email"]);
  }
}
