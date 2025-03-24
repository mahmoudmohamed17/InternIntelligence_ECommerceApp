import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/services/firebase_service.dart';

abstract class HomeLocalDataSource {
  Future<List<ProductEntity>> getProducts({required String productsCategory});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final _firebaseService = FirebaseService();

  @override
  Future<List<ProductEntity>> getProducts({
    required String productsCategory,
  }) async {
    log('Fetching data locally');
    return await _firebaseService.getProducts(
      productsCategory: productsCategory,
    );
  }
}
