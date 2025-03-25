import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/services/firebase_service.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  List<ProductEntity> favoritesProducts = [];
  List<ProductEntity> cartProducts = [];
  double totalPrice = 0.0;

  ProductCubit() : super(ProductState());

  final _firebaseService = FirebaseService();

  Future<void> changeFavoritesStatus(ProductEntity product) async {
    if (product.isAddedToFavorites) {
      favoritesProducts.remove(product);
      product.isAddedToFavorites = false;
    } else {
      favoritesProducts.add(product);
      product.isAddedToFavorites = true;
    }
    await _firebaseService.updateProduct(product);
    emitFavoritesState();
  }

  Future<void> changeCartStatus(ProductEntity product) async {
    if (product.isAddedToCart) {
      totalPrice -= product.productPrice;
      product.isAddedToCart = false;
      cartProducts.remove(product);
    } else {
      totalPrice += product.productPrice;
      product.isAddedToCart = true;
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
