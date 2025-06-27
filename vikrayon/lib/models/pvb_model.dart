import 'package:flutter/material.dart';

class PvbModel {
  final List<String> pvbanners;
  final Color pvbordercolor;

  PvbModel({
    required this.pvbanners,
    required this.pvbordercolor,
  });

  factory PvbModel.fromJson(Map<String, dynamic> json) {
    return PvbModel(
      pvbanners: List<String>.from(json['pvbanners']??[],
      ),
      pvbordercolor: _parseColor(json['colorHex']?? ''),

      );
  }
  static Color _parseColor(String hex){
    hex = hex.replaceAll("#", "");
    if(hex.length == 6) hex = "FF$hex";
     return Color(int.parse("0x$hex"));
    
    }
    
  }
      
