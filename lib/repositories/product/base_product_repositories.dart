import 'package:ecommerce/models/catergory_models.dart';
import 'package:ecommerce/models/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<ProductModel>> getAllProduct();
}