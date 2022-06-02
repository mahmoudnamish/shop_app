class Shopeloginmodels {
  bool ?status;
  String? message;
  Userdata? data; //مرضيش يعمل constractor العادي قال ملهوش استخدام هنا
  Shopeloginmodels.fromjason(Map<String, dynamic> jason) //كانة هنا constractor name
  {
    status =  jason['status'];
    message= jason['message'];
    data = (jason['data'] != null ? Userdata.fromjason(jason['data']): null)!;
  }
}

class Userdata {
  int? id;
  String? name;
  String ?email;
  String ?phone;
  String ?image;
  int ?points;
  int ?oredit;
  String? token;
  Userdata({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.oredit,
    this.token,
  });
  //constractor NAME
  Userdata.fromjason(Map<String, dynamic> jason) {
    id = jason['id'];
    name = jason['name'];
    email = jason['email'];
    phone = jason['phone'];
    image = jason['image'];
    points = jason['points'];
    oredit = jason['oredit'];
    token = jason['token'];
  }
}
