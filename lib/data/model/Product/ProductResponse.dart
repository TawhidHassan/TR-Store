// ignore_for_file: file_names
import 'package:TrStore/data/model/Product/Product.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'ProductResponse.freezed.dart';
part 'ProductResponse.g.dart';

@JsonSerializable()

@freezed
class ProductResponse with _$ProductResponse{


  @JsonSerializable(explicitToJson: true)
  const factory ProductResponse({
    List<Product>? product,
  })= _ProductResponse;


  factory ProductResponse.fromJson(Map<String, dynamic>json)=> _$ProductResponseFromJson(json);


}