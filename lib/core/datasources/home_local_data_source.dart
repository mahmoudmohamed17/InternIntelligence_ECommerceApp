import 'dart:developer';

import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/services/firebase_service.dart';

abstract class HomeLocalDataSource {
  Future<List<ProductEntity>> getProducts({required String productsCategory});
  Future<void> addProducts({required List<ProductEntity> products});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final _firebaseService = FirebaseService();

  @override
  Future<List<ProductEntity>> getProducts({
    required String productsCategory,
  }) async {
    log('Fetching products from local data source');
    return await _firebaseService.getProducts(
      productsCategory: productsCategory,
    );
  }

  @override
  Future<void> addProducts({required List<ProductEntity> products}) async {
    await _firebaseService.addProducts(products);
  }
}
