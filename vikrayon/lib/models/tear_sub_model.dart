class TearDropProduct {
  final int id;
  final String logo;
  final String name;
  bool isFavourite;
  bool isInCart;
  final String borderColor;

  TearDropProduct( {
    required this.id,
    required this.logo,
    required this.name,
    this.isFavourite = false,
    this.isInCart = false,
    required this.borderColor,
  });

  factory TearDropProduct.fromJson(Map<String, dynamic> json) {
    return TearDropProduct(
        id: json['id'],
        logo: json['logo'] ?? '',
        name: json['name'],
        isFavourite: json['isFavourit'] ?? false,
        isInCart: json['isInCart'] ?? false,
        borderColor: json['borderColor'] ?? '',
        );

  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'logo': logo,
        'name': name,
        'isFavourit': isFavourite,
        'isInCart': isInCart.hashCode,
        'borderColor': borderColor,
      };
}

class Subcategory {
  final int id;
  final String name;
  List<TearDropProduct> products; 

  Subcategory({
    required this.id,
    required this.name,
    required this.products,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json){
    var productJson = json['products'] as List<dynamic>? ?? [];
    List<TearDropProduct> productsList = productJson.map((e) => TearDropProduct.fromJson(e)).toList();
    return Subcategory(
      id: json['id'],
      name: json['name'],
      products: productsList,

    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'products': products.map((p) => p.toJson()).toList(),
  };
}
