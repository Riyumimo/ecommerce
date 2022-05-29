part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent{
  
  @override
  List<Object> get props => [];

}

class UpdateProducts extends ProductEvent{
 final List<ProductModel> producst;
  const UpdateProducts(this.producst);
  @override
  List<Object> get props => [producst];
 
}
