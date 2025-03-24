part of 'home_cubit.dart';

enum HomeStatus { loading, success, failed }

class HomeState {
  final HomeStatus status;
  final List<ProductEntity> products;
  final String selectedEndpoint;
  final String failureMessage;

  HomeState({
    required this.status,
    required this.products,
    required this.selectedEndpoint,
    required this.failureMessage,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<ProductEntity>? products,
    String? selectedEndpoint,
    String? failureMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      selectedEndpoint: selectedEndpoint ?? this.selectedEndpoint,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }
}
