import 'package:ecommerce/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  const Cart({this.producst = const<ProductModel>[]});
  final List<ProductModel> producst;


  double get subtotal => producst.fold(0, (total, current) => total + current.price);


  double deleveryfree(subtotal){
    if(subtotal >= 20000){
      return 0.0;

    }else
    return 20000;
  }

  String freeDelevery(subtotal){
    if(subtotal >= 200000){
      return 'You Have Free Delevery';

    }else{
    double missing = 200000 - this.subtotal;
    return 'Add \$${missing.toStringAsFixed(2)}';
    }
  }

  double total (subtotal,deleveryFee){
    return subtotal+deleveryFee(subtotal);
  }

  String get freeDeleveryString=>  freeDelevery(subtotal.toString());
  String get totalString=>  total(subtotal,deleveryfree).toString();
  String get subtotalString => subtotal.toStringAsFixed(2);
  String get deleveryFeeString => deleveryfree(subtotal).toString();



  @override
  // TODO: implement props
  List<Object?> get props => [producst];

  
}