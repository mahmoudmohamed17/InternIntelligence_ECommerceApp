import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
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
      favoritesProducts.remove(product);
      product.isAddedToFavorites = false;
    } else {
      favoritesProducts.add(product);
      product.isAddedToFavorites = true;
    }
    emitFavoritesState();
  }

  void changeCartStatus(BuildContext context, ProductEntity product) {
    if (product.isAddedToCart) {
      cartProducts.remove(product);
      totalPrice -= product.productPrice;
      product.isAddedToCart = false;
    } else {
      cartProducts.add(product);
      totalPrice += product.productPrice;
      product.isAddedToCart = true;
    }
    emitCartState();
  }

  void changeProductStatus() {
    emit(ProductChanged());
  }

  Future<void> updateProduct(ProductEntity product) async {
    await _firebaseService.updateProduct(product);
  }

  void emptyCart() {
    for (var product in cartProducts) {
      product.isAddedToCart = false;
    }
    totalPrice = 0.0;
    cartProducts.clear();
    emitCartState();
  }

  Future<void> emptyCartList(List<ProductEntity> products) async {
    for (var product in cartProducts) {
      _firebaseService.updateProduct(product);
    }
  }

  void emitFavoritesState() {
    log('Favorites list has ${favoritesProducts.length} item');
    if (favoritesProducts.isEmpty) {
      emit(ProductFavoritesInitial());
    } else {
      emit(
        ProductFavoritesFilled(products: List.unmodifiable(favoritesProducts)),
      );
    }
  }

  void emitCartState() {
    log('Cart list has ${cartProducts.length} item');
    if (cartProducts.isEmpty) {
      emit(ProductCartInitial());
    } else {
      emit(ProductCartFilled(products: List.unmodifiable(cartProducts)));
    }
  }
}
