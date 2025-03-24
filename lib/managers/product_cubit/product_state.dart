part of 'product_cubit.dart';

class ProductState {}

final class ProductFavoritesInitial extends ProductState {}

final class ProductFavoritesSuccess extends ProductState {
  final List<ProductEntity> products;

  ProductFavoritesSuccess({required this.products});
}

final class ProductCartInitial extends ProductState {}

final class ProductCartSuccess extends ProductState {
  final List<ProductEntity> products;

  ProductCartSuccess({required this.products});
}
