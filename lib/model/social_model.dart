class SocialUserModel {
  String? email;
  String? uId;
  String? name;
  String? phone;

  SocialUserModel({this.email, this.uId, this.name, this.phone});

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    uId = json['uId'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email':email,
      'phone':phone,
      'uId':uId,
      'name':name,
    };
  }
}
