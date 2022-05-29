part of 'cart_bloc.dart';
@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
   @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent{
     @override
  List<Object> get props => [];
}
class CartProductAdded extends CartEvent {
  final ProductModel productModel;
  const CartProductAdded(this.productModel);

  @override
  List<Object> get props => [productModel];
}

class CartProductRemove extends CartEvent {
  final ProductModel productModel;
  const CartProductRemove(this.productModel);

  @override
  List<Object> get props => [productModel];
}
