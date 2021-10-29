class ShopLoginModel{
  bool? status;
  String? message;
  UserData? data;


  ShopLoginModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    data=json['data'] !=null ? UserData.fromJson(json['data']) : null;

  }

}



class UserData{
  int? id;
  int? points;
  int? credit;
  String? name;
  String? email;
  String? image;
  String? phone;
  String? token;

//   UserData({
//     this.id,
//     this.email,
//     this.image,
//     this.credit,
//     this.name,
//     this.phone,
//     this.points,
//     this.token,
// });
//NAMED CONSTRUCTOR
  UserData.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    email=json['email'];
    image=json['image'];
    credit=json['credit'];
    name=json['name'];
    phone=json['phone'];
    points=json['points'];
    token=json['token'];


  }

}