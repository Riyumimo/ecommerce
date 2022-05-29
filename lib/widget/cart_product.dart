import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../blocs/cart/cart_bloc.dart';
import '../models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final ProductModel productModel;
  final int quantity;
  const CartProductCard({Key? key, required this.productModel,required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Image.network(
            productModel.imageUrl,
            width: 100,
            height: 80,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                productModel.name,
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                productModel.price.toString(),
              )
            ],
          ),
          Spacer(),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductRemove(productModel));
                      },
                      icon: Icon(Icons.remove_circle_outline)),
                      
                  Text("$quantity", style:GoogleFonts.poppins(fontSize: 14)),
                  IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductAdded(productModel));
                      },
                      icon: Icon(Icons.add_circle_outline)),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
