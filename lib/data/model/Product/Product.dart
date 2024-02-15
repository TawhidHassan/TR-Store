// ignore_for_file: file_names
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'Product.freezed.dart';
part 'Product.g.dart';

@JsonSerializable()

@freezed
class Product with _$Product{
  

  @JsonSerializable(explicitToJson: true)
  const factory Product({
    int? id,
    int? userId,
    String? slug,
    String? url,
    String? title,
    String? content,
    String? image,
    String? thumbnail,
    String? status,
    String? category,
    String? publishedAt,
    String? updatedAt,
  })= _Product;


  factory Product.fromJson(Map<String, dynamic>json)=> _$ProductFromJson(json);


}