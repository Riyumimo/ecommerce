import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<CartProductAdded>(_onAddProduct);
    on<CartProductRemove>(_onRemoveProduct);
  }

  _onLoadCart(event, Emitter<CartState> emit) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 3));
      emit(CartLoaded());
    } catch (e) {
      emit(CartError());
    }
  }

  _onAddProduct(CartProductAdded event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              producst: List.from(state.cart.producst)..add(event.productModel),
            ),
          ),
        );
      } catch (e) {
        emit(CartError());
      }
    }
  }

  _onRemoveProduct(CartProductRemove event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
                producst: List.from(state.cart.producst)
                  ..remove(event.productModel))));
      } catch (e) {
        emit(CartError());
      }
    }
  }
}
