class ProductEntity {
  String productId;
  final String productCategory;
  final String productName;
  final String productDescription;
  final List<String> productImages;
  final num productRate;
  final num productPrice;
  bool isAddedToFavorites;
  bool isAddedToCart;

  ProductEntity({
    this.productId = '',
    required this.productCategory,
    required this.productName,
    required this.productDescription,
    required this.productImages,
    required this.productRate,
    required this.productPrice,
    this.isAddedToFavorites = false,
    this.isAddedToCart = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'productID': productId,
      'productCategory': productCategory,
      'productName': productName,
      'productDescription': productDescription,
      'productImages': productImages,
      'productRate': productRate,
      'productPrice': productPrice,
      'isAddedToFavorites': isAddedToFavorites,
      'isAddedToCart': isAddedToCart,
    };
  }

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      productId: json['productId'] as String,
      productCategory: json['productCategory'] as String,
      productName: json['productName'] as String,
      productDescription: json['productDescription'] as String,
      productImages: List<String>.from(json['productImages']),
      productRate: json['productRate'] as num,
      productPrice: json['productPrice'] as num,
      isAddedToFavorites: json['isAddedToFavorites'] as bool? ?? false,
      isAddedToCart: json['isAddedToCart'] as bool? ?? false,
    );
  }
}
