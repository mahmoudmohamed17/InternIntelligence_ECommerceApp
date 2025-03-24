import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/services/firebase_service.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  List<ProductEntity> favoritesProducts = [];
  List<ProductEntity> cartProducts = [];

  ProductCubit() : super(ProductInitial());

  final _firebaseService = FirebaseService();

  Future<void> changeFavoritesStatus(ProductEntity product) async {
    if (product.isAddedToFavorites) {
      product.isAddedToFavorites = false;
    } else {
      product.isAddedToFavorites = true;
    }
    await _firebaseService.updateProduct(product);
    emit(ProductFavoritesSuccess());
  }

  Future<void> changeCartStatus(ProductEntity product) async {
    if (product.isAddedToCart) {
      product.isAddedToCart = false;
    } else {
      product.isAddedToCart = true;
    }
    await _firebaseService.updateProduct(product);
    emit(ProductCartSuccess());
  }
}
