
class Categoriesmodele{
  bool ?status ;
  categoriesdata ?data;
  Categoriesmodele.fromjson(Map<String,dynamic>json){
    status = json['status'];
    data = categoriesdata.fromjson(json['data']);
  }
}

class categoriesdata {
int? current_page;
String? first_page_url;
int? from;
dynamic? last_page;
dynamic ? last_page_url;
dynamic ? next_page_url;
dynamic ? path;
dynamic ? per_page;
dynamic ? total;
List <Data>  data =[];

  categoriesdata.fromjson(Map<String,dynamic>json){
    current_page = json['current_page'];
    first_page_url = json['first_page_url'];
    from = json['from'];
    last_page = json['last_page'];
    last_page_url = json['last_page_url'];
    next_page_url = json['next_page_url'];
    path = json['path'];
    per_page = json['per_page'];
    total = json['total'];
    json['data'].forEach((element)
    {
      data.add(Data.fromjson(element));
    });


  }

}

class Data {
 int? id ;
 String? name ;
 String ?image;


 Data.fromjson(Map<String,dynamic>json)
  {
      id = json['id'];
      name = json['name'];
      image = json['image'];

  }
}