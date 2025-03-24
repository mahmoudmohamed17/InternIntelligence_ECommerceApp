import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/services/firebase_service.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  List<ProductEntity> favoritesProducts = [];
  List<ProductEntity> cartProducts = [];

  ProductCubit() : super(ProductInitial());

  final _firebaseService = FirebaseService();

  Future<void> addToFavorites(ProductEntity product) async {
    product.isAddedToFavorites = true;
    await _firebaseService.updateProduct(product);
    favoritesProducts.add(product);
    emit(ProductFavoritesSuccess());
  }

  Future<void> removeFromFavorites(ProductEntity product) async {
    product.isAddedToFavorites = false;
    await _firebaseService.updateProduct(product);
    favoritesProducts.remove(product);
    emit(ProductFavoritesSuccess());
  }

  Future<void> addToCart(ProductEntity product) async {
    product.isAddedToCart = true;
    await _firebaseService.updateProduct(product);
    cartProducts.remove(product);
    emit(ProductCartSuccess());
  }

  Future<void> removeFromCart(ProductEntity product) async {
    product.isAddedToCart = false;
    await _firebaseService.updateProduct(product);
    cartProducts.remove(product);
    emit(ProductCartSuccess());
  }
}
