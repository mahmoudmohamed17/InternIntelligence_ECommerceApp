import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/datasources/home_remote_data_source.dart';
import 'package:e_commerce_app/core/errors/api_server_failure.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {

  HomeRepoImpl();

final homeRemoteDataSource = HomeRemoteDataSourceImpl();

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    required String endpoint,
  }) async {
    try {
      var products = await homeRemoteDataSource.getProducts(endpoint: endpoint);
      return right(products);
    } on DioException catch (e) {
      return left(ApiServerFailure.fromDioException(e));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
