part of 'cart_cubit.dart';

final class CartState {}

final class CartInitial extends CartState {}

final class CartFilled extends CartState {
  final List<ProductEntity> products;

  CartFilled({required this.products});
}
