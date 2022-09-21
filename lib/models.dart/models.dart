class ContactModel {
  int id;
  String name;
  String mobile;
  String? email;
  String? streetAddress;
  String? dop;
  String? image;
  bool favorite;

  ContactModel({
    this.id =1,
    required this.name,
    required this.mobile,
    this.email,
    this.streetAddress,
    this.dop,
    this.image,
    this.favorite =false,

  });

}
