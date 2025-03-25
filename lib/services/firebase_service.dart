import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';

class FirebaseService {
  CollectionReference users = FirebaseFirestore.instance.collection('products');
  Future<void> addProducts(List<ProductEntity> products) async {
    await Future.wait(
      products.map((product) async {
        DocumentReference docRef = await users.add({
          'productId': product.productId,
          'productName': product.productName,
          'productDescription': product.productDescription,
          'productCategory': product.productCategory,
          'productImages': product.productImages,
          'isAddedToCart': product.isAddedToCart,
          'isAddedToFavorites': product.isAddedToFavorites,
          'productRate': product.productRate,
          'productPrice': product.productPrice,
        });
        product.productId = docRef.id;
        updateProduct(product);
      }),
    );
  }

  Future<List<ProductEntity>> getAllProducts() async {
    List<ProductEntity> products = [];
    QuerySnapshot querySnapshot = await users.get();
    for (var doc in querySnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;
      var product = ProductEntity.fromJson(data);
      products.add(product);
    }
    return products;
  }

  Future<List<ProductEntity>> getProductsByCategory({
    required String productsCategory,
  }) async {
    List<ProductEntity> products = [];
    QuerySnapshot querySnapshot =
        await users.where('productCategory', isEqualTo: productsCategory).get();
    for (var doc in querySnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;
      var product = ProductEntity.fromJson(data);
      products.add(product);
    }
    return products;
  }

  Future<void> updateProduct(ProductEntity product) async {
    await users.doc(product.productId).update({
      'productId': product.productId,
      'isAddedToCart': product.isAddedToCart,
      'isAddedToFavorites': product.isAddedToFavorites,
    });
  }
}
