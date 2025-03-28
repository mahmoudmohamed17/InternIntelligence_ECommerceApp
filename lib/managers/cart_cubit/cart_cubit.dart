import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/core/helpers/snack_bar.dart';
import 'package:e_commerce_app/services/firebase_service.dart';
import 'package:flutter/widgets.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<ProductEntity> cartProducts = [];
  double totalPrice = 0.0;
  final firebaseService = FirebaseService();

  void changeCartStatus(BuildContext context, ProductEntity product) {
    if (product.isAddedToCart) {
      cartProducts.remove(product);
      totalPrice -= product.productPrice;
      snackBar(context, 'Product removed from Cart.');
    } else {
      cartProducts.add(product);
      totalPrice += product.productPrice;
      snackBar(context, 'Product added to Cart!');
    }
    emitCartState();
  }

  void emptyCart() {
    for (var product in cartProducts) {
      product.isAddedToCart = false;
    }
    totalPrice = 0.0;
    cartProducts.clear();
    emitCartState();
  }

  Future<void> updateCartEmptyBackend() async {
    for (var product in cartProducts) {
      await firebaseService.updateProduct(product);
    }
  }

  emitCartState() {
    if (cartProducts.isEmpty) {
      emit(CartInitial());
    } else {
      emit(CartFilled(products: List.unmodifiable(cartProducts)));
    }
  }
}
