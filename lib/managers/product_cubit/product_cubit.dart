import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/core/helpers/snack_bar.dart';
import 'package:e_commerce_app/services/firebase_service.dart';
import 'package:flutter/material.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  List<ProductEntity> favoritesProducts = [];
  List<ProductEntity> cartProducts = [];
  double totalPrice = 0.0;

  ProductCubit() : super(ProductState());

  final _firebaseService = FirebaseService();

  Future<void> changeFavoritesStatus(
    BuildContext context,
    ProductEntity product,
  ) async {
    if (product.isAddedToFavorites) {
      product.isAddedToFavorites = false;
      snackBar(context, 'Product removed from Favorites.');
      favoritesProducts.remove(product);
    } else {
      product.isAddedToFavorites = true;
      snackBar(context, 'Product added to Favorites!');
      favoritesProducts.add(product);
    }
    await _firebaseService.updateProduct(product);
    emitFavoritesState();
  }

  Future<void> changeCartStatus(
    BuildContext context,
    ProductEntity product,
  ) async {
    if (product.isAddedToCart) {
      totalPrice -= product.productPrice;
      product.isAddedToCart = false;
      snackBar(context, 'Product removed from Cart.');
      cartProducts.remove(product);
    } else {
      totalPrice += product.productPrice;
      product.isAddedToCart = true;
      snackBar(context, 'Product added to Cart!');
      cartProducts.add(product);
    }
    await _firebaseService.updateProduct(product);
    emitCartState();
  }

  void emitFavoritesState() {
    if (favoritesProducts.isEmpty) {
      emit(ProductFavoritesInitial());
    } else {
      emit(
        ProductFavoritesSuccess(products: List.unmodifiable(favoritesProducts)),
      );
    }
  }

  void emitCartState() {
    if (cartProducts.isEmpty) {
      emit(ProductCartInitial());
    } else {
      emit(ProductCartSuccess(products: List.unmodifiable(cartProducts)));
    }
  }
}
