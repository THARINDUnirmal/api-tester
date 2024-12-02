class ProductModel {
  int? id;
  String? title;
  num? price;
  String? category;
  String? description;
  String? image;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.category,
      this.description,
      this.image});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    category = json['category'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['category'] = category;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}
