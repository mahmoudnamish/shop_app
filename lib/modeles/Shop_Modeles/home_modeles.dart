class ShopeHomemodeles {
  bool? Status;
  HomeDatamodele? data;
  ShopeHomemodeles.Fromejson(Map<String, dynamic> json) {
    Status = json['status'];
    data = HomeDatamodele.Fromejson(json['data']);
  }
}

class HomeDatamodele {
  List<Bannersmodele> banners = [];
  List<productsmodele> products = [];

  HomeDatamodele.Fromejson(Map<String, dynamic> jason) {
    jason['banners'].forEach((element) {
      banners.add(Bannersmodele.Fromejson(element));
    });
    jason['products'].forEach((element) {
      products.add(productsmodele.Fromejson(element));
    });
  }
}

class Bannersmodele {
  int? id;
  String? image;

  Bannersmodele.Fromejson(Map <String,dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class productsmodele {
    int ?id;
    dynamic ? discount;
  dynamic? price;
  dynamic ?old_price;
  String ?image;
  String ?name;
  bool ?in_favorites;
  bool ?in_cart;

  productsmodele.Fromejson(Map<String, dynamic> json) {
    id = json['id'];
    discount = json['discount'];
    price = json['price'];
    old_price = json['old_price'];
    image = json['image'];
    name = json['name'];
    image = json['image'];
    in_favorites = json['in_favorites'];
    in_cart = json[' in_cart'];
  }
}
