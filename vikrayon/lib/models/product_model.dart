
class ProductModel {
  final int id;
  final String name;
  final String image;
  final String description;
  final double price;
  final int quantity;
  final double discount;
  final double rating;
  final List<String> relatedImages;
  final String unitType;
  final String colorHex;
  final List<String> gradientColors;
  bool isFavourite;
  bool isInCart;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.quantity,
    required this.discount,
    required this.rating,
    required this.relatedImages,
    required this.unitType,
    required this.colorHex,
    required this.gradientColors,
    this.isFavourite = false,
    this.isInCart = false,
  });

  double get discountPrice => price * (1 - discount / 100);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      discount: (json['discount'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      relatedImages: List<String>.from(json['relatedImages'] ?? []),
      unitType: json['unitType'] ?? '',
      colorHex: json['colorHex'] ?? '',
      gradientColors: List<String>.from(json['gradientColors'] ?? []),
      isFavourite: json['isFavourite'] ?? false,
      isInCart: json['isInCart'] ?? false,
      );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'description': description,
        'price': price,
        'quantity': quantity,
        'discount': discount,
        'rating': rating,
        'relatedImages': relatedImages,
        'unitType': unitType,
        'colorHex': colorHex,
        'gradientColors': gradientColors,
        'isFavourite': isFavourite,
        'isInCart': isInCart,
      };
}

 