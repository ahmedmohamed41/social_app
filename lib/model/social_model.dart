class SocialUserModel {
  String? email;
  String? uId;
  String? name;
  String? phone;
  String? image;
  String? cover;
  String? bio;
  bool? isEmailVerified;

  SocialUserModel({this.email, this.uId, this.name, this.phone,this.isEmailVerified,this.cover,this.image,this.bio});

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    uId = json['uId'];
    name = json['name'];
    phone = json['phone'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email':email,
      'phone':phone,
      'uId':uId,
      'name':name,
      'image':image,
      'cover':cover,
      'bio':bio,
      'isEmailVerified':isEmailVerified,
    };
  }
}
