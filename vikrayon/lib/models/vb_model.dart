
import 'dart:ui';

class VbModel {
  final List<String> image;
  final Color borderColor;

  VbModel({required this.image, required this.borderColor});

  factory VbModel.fromJson(Map<String, dynamic> json) {
    return VbModel(
      image: json['image'],
      borderColor: _parseColor(json['colorHex']?? ''),
    );
  }

  static Color _parseColor(String hex) {
    hex = hex.replaceAll("#", "");
    if (hex.length == 6) {
      hex = "FF$hex";
    }
    return Color(int.parse("0x$hex"));
  }
}