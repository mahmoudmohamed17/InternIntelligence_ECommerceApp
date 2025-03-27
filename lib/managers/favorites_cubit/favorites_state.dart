part of 'favorites_cubit.dart';

final class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesFilled extends FavoritesState {
  final List<ProductEntity> products;

  FavoritesFilled({required this.products});
}
