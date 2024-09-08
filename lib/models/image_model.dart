import 'dart:convert';
import 'package:chat_app/models/image_model.dart';
import 'package:json_serializer/json_serializer.dart';

class PixelFormImage {
  String id;
  String filename;
  String? title;
  String urlfullform;
  String urlshortform;

  PixelFormImage(
      {required this.id,
      required this.filename,
      this.title,
      required this.urlfullform,
      required this.urlshortform,
      });

  // factory PixelFormImage.fromJson(Map<String, dynamic> json){
  //   var some = JsonSerializerOptions(types: [
  //   UserType<PixelFormImage>(PixelFormImage.new)
  //   ]);
  //   return some;
  // }
}

