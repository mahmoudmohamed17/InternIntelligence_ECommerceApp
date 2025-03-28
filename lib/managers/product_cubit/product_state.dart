part of 'product_cubit.dart';

final class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductChanged extends ProductState {}
final class ProductFavoritesInitial extends ProductState {}


final class ProductFavoritesFilled extends ProductState {
  final List<ProductEntity> products;

  ProductFavoritesFilled({required this.products});
}

final class ProductCartInitial extends ProductState {}

final class ProductCartFilled extends ProductState {
  final List<ProductEntity> products;

  ProductCartFilled({required this.products});
}
