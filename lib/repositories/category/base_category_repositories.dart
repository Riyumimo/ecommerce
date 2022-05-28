import 'package:ecommerce/models/catergory_models.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}