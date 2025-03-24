import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  List<ProductEntity> favoritesProducts = [];
  List<ProductEntity> cartProducts = [];

  ProductCubit() : super(ProductInitial());
}
