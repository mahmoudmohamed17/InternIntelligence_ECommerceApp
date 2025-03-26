import 'dart:developer';

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

  void changeFavoritesStatus(BuildContext context, ProductEntity product) {
    if (product.isAddedToFavorites) {
      log('Removing product');
      favoritesProducts.remove(product);
      product.isAddedToFavorites = false;
      snackBar(context, 'Product removed from Favorites.');
    } else {
      favoritesProducts.add(product);
      product.isAddedToFavorites = true;
      snackBar(context, 'Product added to Favorites!');
    }
    log('Favorites done!');
    emitFavoritesState();
  }

  void changeCartStatus(BuildContext context, ProductEntity product) {
    if (product.isAddedToCart) {
      cartProducts.remove(product);
      totalPrice -= product.productPrice;
      product.isAddedToCart = false;
      snackBar(context, 'Product removed from Cart.');
    } else {
      cartProducts.add(product);
      totalPrice += product.productPrice;
      product.isAddedToCart = true;
      snackBar(context, 'Product added to Cart!');
    }
    emitCartState();
  }

  Future<void> updateBackend(ProductEntity product) async {
    await _firebaseService.updateProduct(product);
    await _firebaseService.getProductsByCategory(
      productsCategory: product.productCategory,
    );
  }

  void emptyCart() {
    for (var product in cartProducts) {
      product.isAddedToCart = false;
      _firebaseService.updateProduct(product);
    }
    totalPrice = 0.0;
    cartProducts.clear();
    emitCartState();
  }

  void emitFavoritesState() {
    if (favoritesProducts.isEmpty) {
      emit(ProductFavoritesInitial());
    } else {
      emit(
        ProductFavoritesFilled(products: List.unmodifiable(favoritesProducts)),
      );
    }
  }

  void emitCartState() {
    if (cartProducts.isEmpty) {
      emit(ProductCartInitial());
    } else {
      emit(ProductCartFilled(products: List.unmodifiable(cartProducts)));
    }
  }
}
