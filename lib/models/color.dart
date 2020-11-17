class Color {

  String colorId;
  String name;
  List<Color> data;

  Color({this.colorId, this.name, this.data});

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
      colorId: json['color_id'],
      name: json['name']
    );
  }

  Map<String, dynamic> toJson() => {
    'color_id': colorId,
    'name': name,
  };

  factory Color.fromArrayJson(List<dynamic> jsonArray) {
    List<Color> data = [];
    for(var i = 0; i < jsonArray.length; i++) {
      data.add(Color.fromJson(jsonArray[i]));
    }
    return Color(data: data);
  }
}