class SocialUserModel
{
  String? name;
  String? email;
  String? phone;
  String? Uid;
  String? image;
  String? cover;
  String? bio;
  bool? isEmailVerified;
  SocialUserModel({
    this.name,
    this.email,
    this.phone,
    this.Uid,
    this.image,
    this.cover,
    this.bio,
    this.isEmailVerified,
});
  SocialUserModel.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    Uid=json['Uid'];
    image=json['image'];
    cover=json['cover'];
    bio=json['bio'];
    isEmailVerified=json['isEmailVerified'];

  }
  Map<String,dynamic> toMap()
  {
    return{
      'name':name,
      'email':email,
      'phone':phone,
      'Uid':Uid,
      'image':image,
      'cover':cover,
      'bio':bio,
      'isEmailVerified':isEmailVerified,

    };
  }
}