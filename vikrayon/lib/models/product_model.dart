import 'package:flutter/material.dart';

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
  final Color borderColor;
  final LinearGradient gradientColors;
   final String sliderTag;
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
   required this.borderColor,
    required this.gradientColors,
    required this.sliderTag,
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
      borderColor: _parseColor(json['bordercolor'] ),
      gradientColors:
         _parseGradient(json['gradientColors'][0], json['gradientColors'][1]),
      sliderTag: json['sliderTag'],
      isFavourite: json['isFavourite'] ?? false,
      isInCart: json['isInCart'] ?? false,
    );
  }
  static Color _parseColor(String hex) {
    hex = hex.replaceAll("#", "");
    if (hex.length == 6) hex = "FF$hex";
    return Color(int.parse("0x$hex"));
  }

  static LinearGradient _parseGradient(
      String topcenterHex, String bottomcenterhex) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        _parseColor(topcenterHex),
        _parseColor(bottomcenterhex),
      ],
      stops: const [0.5, 0.8],
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
        'bordercolor': '#${borderColor.value.toRadixString(16).substring(2)}',
        'gradientColors':
            '#${gradientColors.colors[0].value.toRadixString(16).substring(2)}#${gradientColors.colors[1].value.toRadixString(16).substring(2)}', // gradientColors,
        'isFavourite': isFavourite,
        'isInCart': isInCart,
      };
}


final List<Map<String, dynamic>> products = [
  {
    "id": 1,
    "name": "Apple's",
    "borderColor": "#4ce305",
    "gradientColors": ["#ffffffff", "#4ce305"],
    "description": "Fresh Apple's from organic farm's",
    "image":
        "https://res.cloudinary.com/ddlyhla10/image/upload/v1748403658/apples-removebg-preview_Small_zj84ub.png",
    "sliderTag": "Fruits",
    "unitType": "Kg",
    "price": 120.0,
    "quantity": 6,
    "discount": 20.0,
    "rating": 4.5
  },
  {
    "id": 2,
    "name": "Banana's",
    "borderColor": "#4ce305",
    "gradientColors": ["#ffffffff", "#4ce305"],
    "description": "Fresh Banana's from organic farm's",
    "image":
        "https://res.cloudinary.com/ddlyhla10/image/upload/v1748403662/bannas-removebg-preview_Small_qhb7vy.png",
    "sliderTag": "Fruits",
    "unitType": "Kg",
    "price": 120.0,
    "quantity": 6,
    "discount": 20.0,
    "rating": 4.5
  },
  {
    "id": 3,
    "name": "Cherry's",
    "borderColor": "#4ce305",
    "gradientColors": ["#ffffffff", "#4ce305"],
    "description": "Fresh Cherry's from organic farm's",
    "image":
        "https://res.cloudinary.com/ddlyhla10/image/upload/v1748403665/cherrys-removebg-preview_Small_qtkofq.png",
    "sliderTag": "Fruits",
    "unitType": "Kg",
    "price": 120.0,
    "quantity": 6,
    "discount": 20.0,
    "rating": 4.5
  },
  {
    "id": 4,
    "name": "Dates",
    "borderColor": "#4ce305",
    "gradientColors": ["#ffffffff", "#4ce305"],
    "description": "Fresh Dates from organic farm's",
    "image":
        "https://res.cloudinary.com/ddlyhla10/image/upload/v1748403668/dates-removebg-preview_Small_ah2zg8.png",
    "sliderTag": "Fruits",
    "unitType": "Kg",
    "price": 120.0,
    "quantity": 6,
    "discount": 20.0,
    "rating": 4.5
  },
  {
    "id": 5,
    "name": "Grapes's",
    "borderColor": "#4ce305",
    "gradientColors": ["#ffffffff", "#4ce305"],
    "description": "Fresh Grapes's from organic farm's",
    "image":
        "https://res.cloudinary.com/ddlyhla10/image/upload/v1748403680/Grapes-removebg-preview_Small_uruhdk.png",
    "sliderTag": "Fruits",
    "unitType": "Kg",
    "price": 120.0,
    "quantity": 6,
    "discount": 20.0,
    "rating": 4.5
  },
  {
    "id": 6,
    "name": "Elderberry's",
    "borderColor": "#4ce305",
    "gradientColors": ["#ffffffff", "#4ce305"],
    "description": "Fresh Elderberry's from organic farm's",
    "image":
        "https://res.cloudinary.com/ddlyhla10/image/upload/v1748403671/Elderberrys-removebg-preview_Small_h0eoxt.png",
    "sliderTag": "Fruits",
    "unitType": "Kg",
    "price": 120.0,
    "quantity": 6,
    "discount": 20.0,
    "rating": 4.5
  },
  {
    "id": 7,
    "name": "Jack Fruits",
    "borderColor": "#4ce305",
    "gradientColors": ["#ffffffff", "#4ce305"],
    "description": "Fresh Jack Fruits from organic farm's",
    "image":
        "https://res.cloudinary.com/ddlyhla10/image/upload/v1748403687/Jackfruits-removebg-preview_Small_iexjav.png",
    "sliderTag": "Fruits",
    "unitType": "Kg",
    "price": 120.0,
    "quantity": 6,
    "discount": 20.0,
    "rating": 4.5
  },
  {
    "id": 8,
    "name": "Fig's",
    "borderColor": "#4ce305",
    "gradientColors": ["#ffffffff", "#4ce305"],
    "description": "Fresh Fig's from organic farm's",
    "image":
        "https://res.cloudinary.com/ddlyhla10/image/upload/v1748403674/Figs-removebg-preview_Small_dshere.png",
    "sliderTag": "Fruits",
    "price": 120.0,
    "unitType": "Kg",
    "quantity": 6,
    "discount": 20.0,
    "rating": 4.5
  },
  {
    "id": 9,
    "name": "Guava Fruits",
    "borderColor": "#4ce305",
    "gradientColors": ["#ffffffff", "#4ce305"],
    "description": "Fresh Guava's from organic farm's",
    "image":
        "https://res.cloudinary.com/ddlyhla10/image/upload/v1748403684/Guavas-removebg-preview_Small_isesdq.png",
    "sliderTag": "Fruits",
    "unitType": "Kg",
    "price": 120.0,
    "quantity": 6,
    "discount": 20.0,
    "rating": 4.5
  },
  {
    "id": 10,
    "name": "Kiwi's",
    "borderColor": "#4ce305",
    "gradientColors": ["#ffffffff", "#4ce305"],
    "description": "Fresh Kiwi's from organic farm's",
    "image":
        "https://res.cloudinary.com/ddlyhla10/image/upload/v1748403690/Kiwi-removebg-preview_Small_nr7dv1.png",
    "sliderTag": "Fruits",
    "unitType": "Kg",
    "price": 120.0,
    "quantity": 6,
    "discount": 20.0,
    "rating": 4.5
  }
];
