import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/datasources/home_local_data_source.dart';
import 'package:e_commerce_app/core/datasources/home_remote_data_source.dart';
import 'package:e_commerce_app/core/errors/api_server_failure.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/helpers/app_constants.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRepoImpl();

  final homeRemoteDataSource = HomeRemoteDataSourceImpl();
  final homeLocalDataSource = HomeLocalDataSourceImpl();

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    required String endpoint,
  }) async {
    List<ProductEntity> products = [];
    try {
      products = await homeLocalDataSource.getProducts(
        productsCategory: endpointsCategoryMap[endpoint]!,
      );
      if (products.isEmpty) {
        products = await homeRemoteDataSource.getProducts(endpoint: endpoint);
        await homeLocalDataSource.addProducts(products: products);
      }
      return right(products);
    } on DioException catch (e) {
      return left(ApiServerFailure.fromDioException(e));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}

Map<String, String> endpointsCategoryMap = {
  AppConstants.shirtEndpoint: AppConstants.shirtCategory,
  AppConstants.shoesEndpoint: AppConstants.shoesCategory,
  AppConstants.jewelleryEndpoint: AppConstants.jewelleryCategory,
  AppConstants.laptopsEndpoint: AppConstants.laptopsCategory,
  AppConstants.smartphonesEndpoint: AppConstants.smartphonesCategory,
  AppConstants.sunglassesEndpoint: AppConstants.sunglassesCategory,
};
