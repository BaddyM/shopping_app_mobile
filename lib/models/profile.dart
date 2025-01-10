class ProfileModel {
  String? lastName;
  String? firstName;
  String? email;
  String? location;

  ProfileModel({
    this.lastName,
    this.firstName,
    this.email,
    this.location,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    lastName = json["last_name"];
    firstName = json["first_name"];
    email = json["email"];
    location = json["location"];
  }
}
