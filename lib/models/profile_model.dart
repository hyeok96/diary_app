class ProfileModel {
  String email;
  String? photoURL;

  ProfileModel({required this.email, this.photoURL});

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      email: map["email"],
    );
  }
}
