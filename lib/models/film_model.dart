class RamenModel {
  final String product_name, img_url, description;
  final int price;

  RamenModel({
    required this.product_name,
    required this.img_url,
    required this.description,
    required this.price,
  });

  factory RamenModel.fromJSON(Map parsedJson) {
    return RamenModel(
      product_name: parsedJson['product_name'],
      img_url: parsedJson['img_url'],
      description: parsedJson['description'],
      price: parsedJson['price'],
    );
  }
}