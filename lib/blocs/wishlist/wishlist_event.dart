part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWishList extends WishlistEvent {}


class AddWishListProduct extends WishlistEvent {
  final ProductModel productModel;
  const AddWishListProduct(this.productModel);
  @override
  List<Object> get props => [productModel];
}


class RemoveWishListProduct extends WishlistEvent {
  final ProductModel productModel;
  const RemoveWishListProduct(this.productModel);
  @override
  List<Object> get props => [productModel];
}
