import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/catergory_models.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/repositories/product/base_product_repositories.dart';

class ProductRepository extends BaseProductRepository {

    final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore}):
  _firebaseFirestore = firebaseFirestore??  FirebaseFirestore.instance;

  @override
  Stream<List<ProductModel>> getAllProduct() {
    // TODO: implement getAllProduct
    return _firebaseFirestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((docs) => ProductModel.fromSnapshot(docs)).toList();
    });
  }
  
  
}