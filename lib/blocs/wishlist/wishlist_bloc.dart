// ignore_for_file: unused_element

import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/models/wishlist_model.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishList>(_mapStartWishListToState);
    on<AddWishListProduct>(_mapAddWishListProductToState);
    on<RemoveWishListProduct>(_mapRemoveWishListProductToState);
  }
  void _mapStartWishListToState(event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(Duration(seconds: 5));
      emit(const WishlistLoaded());
    } catch (_) {}
  }

  void _mapAddWishListProductToState(event, emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishList: WishList(
            products: List.from(state.wishList.products)
              ..add(event.productModel),
          ),
        ));
      } catch (_) {}
    }
  }

  void _mapRemoveWishListProductToState(event, emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishList: WishList(
            products: List.from(state.wishList.products)
              ..remove(event.productModel),
          ),
        ));
      } catch (_) {}
    }
  }
}
