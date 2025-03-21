import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/models/product_model/product_model.dart';

List<ProductEntity> parseData(Map<String, dynamic> data) {
  return List<ProductEntity>.from(
    (data['products'] as List).map((product) => ProductModel.fromJson(product)),
  );
}
