class Pokemon {
  String name;
  String url;
  String img;

  Pokemon({this.name, this.url, this.img});

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['img'] = this.img;
    return data;
  }
}
