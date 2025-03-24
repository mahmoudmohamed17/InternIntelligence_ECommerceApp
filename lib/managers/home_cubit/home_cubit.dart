import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helpers/app_constants.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/repos/home_repo_impl.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
    : super(
        HomeState(
          status: HomeStatus.loading,
          products: [],
          selectedEndpoint: AppConstants.shirtEndpoint,
          failureMessage: '',
        ),
      ) {
    getProducts(endpoint: AppConstants.shirtEndpoint);
  }

  final _homeRepo = HomeRepoImpl();

  Future<void> getProducts({required String endpoint}) async {
    emit(
      state.copyWith(status: HomeStatus.loading, selectedEndpoint: endpoint),
    );

    var result = await _homeRepo.getProducts(endpoint: endpoint);

    result.fold(
      (failure) {
        emit(state.copyWith(status: HomeStatus.failed, failureMessage: failure.message));
      },
      (products) {
        emit(state.copyWith(status: HomeStatus.success, products: products));
      },
    );
  }
}
