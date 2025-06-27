
class BannersModel {
  final int id;
  final List<String> title;
  final List<String> imageUrl;
  final List<String> category;
  final bool mainPage;
  final List<String> vendorPage;
  BannersModel( {
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.mainPage,
    required this.vendorPage,
  });
  
  factory BannersModel.fromJson(Map<String, dynamic> json) {
    return BannersModel(
      id: json['id'] as int,
      title: List<String>.from(json['title'] ?? []),
      imageUrl: List<String>.from(json['imageUrl'] ?? []),
      category: List<String>.from(json['category'] ?? []),
      mainPage: json['mainPage'] as bool,
      vendorPage: List<String>.from(json['vendorPage'] ?? []),
    );
  }
}

