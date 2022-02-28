class PostModel
{
  String? name;
  String? Uid;
  String? image;
  String? dateTime;
  String? text;
  String? postImage;
  PostModel({
    this.name,
    this.dateTime,
    this.text,
    this.Uid,
    this.image,
    this.postImage,
});
  PostModel.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    dateTime=json['dateTime'];
    text=json['text'];
    Uid=json['Uid'];
    image=json['image'];
    postImage=json['postImage'];

  }
  Map<String,dynamic> toMap()
  {
    return{
      'name':name,
      'postImage':postImage,
      'dateTime':dateTime,
      'Uid':Uid,
      'image':image,
      'text':text,


    };
  }
}