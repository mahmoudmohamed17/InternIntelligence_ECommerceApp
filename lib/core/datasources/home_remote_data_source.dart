import 'package:e_commerce_app/core/helpers/parse_data.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/services/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductEntity>> getProducts({required String endpoint});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final _apiService = ApiService();

  @override
  Future<List<ProductEntity>> getProducts({required String endpoint}) async {
    var data = await _apiService.getCategoryProducts(endpoint: endpoint);
    var products = parseData(data);
    return products;
  }
}
