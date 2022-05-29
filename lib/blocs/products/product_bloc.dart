import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecommerce/repositories/product/product_repositories.dart';
import 'package:equatable/equatable.dart';
import '../../models/product_model.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productsRepository;
  StreamSubscription? _productsSubscription;
  ProductBloc({required ProductRepository productsRepository})
      : _productsRepository = productsRepository,
        super(ProductLoading()) {
          
      on<LoadProducts>(_onLoadproduct);
      on<UpdateProducts>(_onUpdateproduct);
    }

    void _onLoadproduct(event,Emitter<ProductState> emit){
      _productsSubscription?.cancel();
      _productsSubscription = _productsRepository.getAllProduct().listen((products) {
        add(UpdateProducts(products));
      });
    }
    void _onUpdateproduct(event,Emitter<ProductState> emit){
        emit(ProductLoaded(producst:event.producst));
    }

}
