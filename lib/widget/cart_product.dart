import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final ProductModel productModel;
  const CartProductCard({Key? key ,required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:10 ),
      child: Row(
        children: <Widget>[
          Image.network(productModel.imageUrl,
          width: 100,
          height: 80,),

          SizedBox(width: 10,) ,
          Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: <Widget>[
              Text(productModel.name,style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold),),
              Text(productModel.price.toString(),)
            ],
          ),
          Spacer(),
          Row(
            children: <Widget>[
              IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline)),
              Text("1"),
              IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline)),

            ],
          )
        ],
      ),
    );
    
  
  }}