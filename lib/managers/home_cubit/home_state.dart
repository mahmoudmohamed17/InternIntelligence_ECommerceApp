part of 'home_cubit.dart';

enum HomeStatus { loading, success, failed }

class HomeState {
  final HomeStatus status;
  final List<ProductEntity> products;
  final String selectedEndpoint;

  HomeState({
    required this.status,
    required this.products,
    required this.selectedEndpoint,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<ProductEntity>? products,
    String? selectedEndpoint,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      selectedEndpoint: selectedEndpoint ?? this.selectedEndpoint,
    );
  }
}
