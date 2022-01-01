class Food {
  late String name;
  late String image;
  late String category;
  Food({required this.name, required this.image, required this.category});

  Food.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    image = json['image'].toString();
    category = json['category'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['category'] = this.category;
    return data;
  }
}
