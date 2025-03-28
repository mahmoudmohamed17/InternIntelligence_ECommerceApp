import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/services/firebase_service.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final _firebaseService = FirebaseService();

  void changeProductStatus() {
    emit(ProductChanged());
  }

  Future<void> updateProduct(ProductEntity product) async {
    await _firebaseService.updateProduct(product);
  }
}
