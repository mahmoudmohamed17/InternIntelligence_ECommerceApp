import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/core/helpers/snack_bar.dart';
import 'package:flutter/widgets.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  List<ProductEntity> favoritesProducts = [];

  void changeFavoritesStatus(BuildContext context, ProductEntity product) {
    if (product.isAddedToFavorites) {
      favoritesProducts.remove(product);
      snackBar(context, 'Product removed from Favorites.');
    } else {
      favoritesProducts.add(product);
      snackBar(context, 'Product added to Favorites!');
    }
    emitFavoritesState();
  }

  emitFavoritesState() {
    if (favoritesProducts.isEmpty) {
      emit(FavoritesInitial());
    } else {
      emit(FavoritesFilled(products: List.unmodifiable(favoritesProducts)));
    }
  }
}
