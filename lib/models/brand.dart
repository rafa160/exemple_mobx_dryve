class Brand {

  String id;
  String name;
  List<Brand> data;

  Brand({this.id, this.name,this.data});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['brand_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    'brand_id': id,
    'name': name,
  };


  factory Brand.fromArrayJson(List<dynamic> jsonArray) {
    List<Brand> data =[];
    for(var i = 0; i < jsonArray.length; i++){
      data.add(Brand.fromJson(jsonArray[i]));
    }
    return Brand(data: data);
  }

}