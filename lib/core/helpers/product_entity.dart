class ProductEntity {
  final int productID;
  final String productCategory;
  final String productName;
  final String productDescription;
  final List<String> productImages;
  final num productRate;
  final num productPrice;
  bool isAddedToFavorites;
  bool isAddedToCart;

  ProductEntity({
    required this.productID,
    required this.productCategory,
    required this.productName,
    required this.productDescription,
    required this.productImages,
    required this.productRate,
    required this.productPrice,
    this.isAddedToFavorites = false,
    this.isAddedToCart = false,
  });
}
