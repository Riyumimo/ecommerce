import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/catergory_models.dart';
import 'package:ecommerce/repositories/category/base_category_repositories.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore}):
  _firebaseFirestore = firebaseFirestore??  FirebaseFirestore.instance;
  @override
  Stream<List<Category>> getAllCategories() {
    // TODO: implement getAllCategories
    return _firebaseFirestore.collection('categories')
    .snapshots()
    .map((snapshot) {
      return snapshot.docs.map((docs) => Category.fromSnapshot(docs)).toList();
    });
  }

  
}