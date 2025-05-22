
//  Appbar Model 

import 'dart:core';
import 'dart:ui';

class AppBarModel {
  late final String logoUrl;
  late final List<Color> gradientColors;
  late final Color searchBorderColor;
  final List<String> tags;

  AppBarModel({
    required this.logoUrl,
    required this.gradientColors,
    required this.searchBorderColor,
    required this.tags,
  });


  factory AppBarModel.fromJson(Map<String, dynamic> json) {
    Color parseColor(String hex) {
      hex = hex.replaceFirst('#', ''); 
      if (hex.length == 6) hex = 'FF$hex';
      return Color(int.parse(hex, radix: 16));
    }
  

  return AppBarModel(logoUrl: json['logoUrl'] ?? '',
  gradientColors: List<String>.from(json['gradientColors'] ?? []).map(parseColor).toList(),
  searchBorderColor: parseColor(json['searchBorderColor'] ?? ''),
  tags: List<String>.from(json['tags'] ?? []),
  );
  }
}
class TearDropItem {
  final int id;
  final String name;
  final String image;

  TearDropItem({
    required this.id,
    required this.name,
    required this.image,
  });

  factory TearDropItem.fromJson(Map<String, dynamic> json) {
    return TearDropItem(
      id: json['id'],
      name: json['name'],
      image: json['image'],// Must be a valid url
    );
  }

  
}

class Vb {
  final int id;
  final String image;

  Vb({
    required this.id,
    required this.image,
  });

  factory Vb.fromJson(Map<String, dynamic> json) {
    return Vb(
      id: json['id'],
      image: json['image'],// Must be a valid url
    );
  }
}

class Pvb {
  final int id;
  
  final String image;

  Pvb({
    required this.id,
    required this.image,
  });

  factory Pvb.fromJson(Map<String, dynamic> json) {
    return Pvb(
      id: json['id'],
      image: json['image'],// Must be a valid url
    );
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
 final  int quantity;
  final double discount;
  final double rating;
  bool isFavourite;
  bool isInCart;
  final List<String> relatedImages;

  Product( {
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
    required this.discount,
    required this.rating,
    this.isFavourite = false,
    this.isInCart = false,
    required this.relatedImages,
  });
 // Getter to calculate the price after discount 
 double get discountPrice => price *(1- discount / 100);

 // factory constructor to create a product from json
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      image: map['image'],
      price: (map['price'] as num).toDouble(),
      discount: map['discount'],
      rating: (map['rating'] as num).toDouble(),
      quantity: (map['quantity'] as num).toInt(), relatedImages: List<String>.from(map['relatedImages']??[]),
    );
  }
  

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        price: (json['price'] as num).toDouble(),
        quantity: (json['quantity'] as num?)?.toInt() ?? 0,
        discount: json['discount'] ?? 0,
        rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
        isFavourite: json['isFavourite'] ?? false,
        isInCart: json['isInCart'] ?? false, relatedImages:List<String>.from(json['relatedImages']??[]),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
        'price': price,
        'quantity': quantity,
        'discount': discount,
        'rating': rating,
        'isFavourite': isFavourite,
        'isInCart': isInCart,
        'relatedImages': relatedImages
      };
}



 

List<Product> loadProducts() {
  List<Map<String, dynamic>> fruitsproducts = [
    // apple's
    {
      "id": 1,
      "name": " Apple's",
      "description": "Fresh Apple's from organic farm's",
      "image": "https://res.cloudinary.com/ddlyhla10/image/upload/v1746452255/apples-removebg-preview_m7fhyj.png",
      "price": 120.0,
      "discount": 20,
      "quantity": 6,
      "rating": 4.5,
    },
    // bannan's
    {
      "id": 2,
      "name": " Banana's",
      "description": "Fresh Bannana's from organic farm's",
      "image": "https://res.cloudinary.com/ddlyhla10/image/upload/v1746452257/bannas-removebg-preview_vx4nqq.png",
      "price": 120.0,
      "discount": 20,
      "quantity": 6,
      "rating": 4.5,
    },
    // cherry's
    {
      "id": 3,
      "name": " Cherry's",
      "description": "Fresh Cherry's from organic farm's",
      "image": "https://res.cloudinary.com/ddlyhla10/image/upload/v1746452259/cherrys-removebg-preview_fejmza.png",
      "price": 120.0,
      "discount": 20,
      "quantity": 6,
      "rating": 4.5,
    },
    // dates
    {
      "id": 4,
      "name": " Dates",
      "description": "Fresh Date's from organic farm's",
      "image": "https://res.cloudinary.com/ddlyhla10/image/upload/v1746452261/dates-removebg-preview_aaw8yu.png",
      "price": 120.0,
      "discount": 20,
      "quantity": 6,
      "rating": 4.5,
    },
    // Elderberrys
    {
      "id": 5,
      "name": " Grapes's",
      "description": " Fresh Grapes's from organic farm's",
      "image": "https://res.cloudinary.com/ddlyhla10/image/upload/v1746452270/Grapes-removebg-preview_jfijk0.png",
      "price": 120.0,
      "discount": 20,
      "quantity": 6,
      "rating": 4.5,
    },
    // elderberry's
    {
      "id": 6,
      "name": " Elderberry's",
      "description": "Fresh Elderberry's \n ssfrom organic farm's",
      "image":
          "https://res.cloudinary.com/ddlyhla10/image/upload/v1746452263/Elderberrys-removebg-preview_oxoway.png",
      "price": 120.0,
      "discount": 20,
      "quantity": 6,
      "rating": 4.5,
    },
    //jack fruits
    {
      "id": 7,
      "name": " Jack Fruits",
      "description": "Fresh Jack Fruit's from organic farm's",
      "image":
          "https://res.cloudinary.com/ddlyhla10/image/upload/v1746452274/Jackfruits-removebg-preview_hmtxtp.png",
      "price": 120.0,
      "discount": 20,
      "quantity": 6,
      "rating": 4.5,
    },
    // fig's
    {
      "id": 8,
      "name": " Fig's",
      "description": "Fresh Fig's from organic farm's",
      "image": "https://res.cloudinary.com/ddlyhla10/image/upload/v1746452266/Figs-removebg-preview_q82bg7.png",
      "price": 120.0,
      "discount": 20,
      "quantity": 6,
      "rating": 4.5,
    },
    // Guava's fruits
    {
      "id": 9,
      "name": " Guava Fruits",
      "description": "Fresh Guava's from organic farm's",
      "image": "https://res.cloudinary.com/ddlyhla10/image/upload/v1746452272/Guavas-removebg-preview_dkw8vo.png",
      "price": 120.0,
      "discount": 20,
      "quantity": 6,
      "rating": 4.5,
    },
    // kiwi's
    {
      "id": 10,
      "name": " Kiwi's",
      "description": "Fresh Kiwi's from organic farm's",
      "image": "https://res.cloudinary.com/ddlyhla10/image/upload/v1746452277/Kiwi-removebg-preview_iylg31.png",
      "price": 120.0,
      "discount": 20,
      "quantity": 6,
      "rating": 4.5,
    },
  ]; // <Map<String, dynamic>>

  List<Product> products =
      fruitsproducts.map((map) => Product.fromMap(map)).toList();

  return products;
}

class MainCategoryModel {
  final String name;
  final String imageUrl;
  final String colorHex;
  final String bannerUrl;

  MainCategoryModel({
    required this.name,
    required this.imageUrl,
    required this.colorHex,
    required this.bannerUrl,
  });

  factory MainCategoryModel.fromJson(Map<String, dynamic> json) {
    return MainCategoryModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
      colorHex: json['colorHex'],
      bannerUrl: json['bannerUrl'],
    );
  }
}