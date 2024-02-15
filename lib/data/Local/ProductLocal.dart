// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ProductLocal {
  int? id;
  String? title;
  String? image;
  int? userId;



  ProductLocal(
      {this.id,
      this.title,
      this.image,
        this.userId,});

  ProductLocal.fromDbMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        image = map['image'],
        userId = map['userId'];

  Map<String, dynamic> toDbMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['userId'] = userId;
    return map;
  }

}