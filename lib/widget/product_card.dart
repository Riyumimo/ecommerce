
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../models/product_model.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    required this.product,
    Key? key,
  }) : super(key: key);
  final List<ProductModel> product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: product.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5),
              child: GestureDetector(
                onTap: () {},
                child: ProductCard(
                  product: product[index],
                  widthFactor: 2.5,
                ),
              ),
            );
          }),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.widthFactor,
    required this.product,
    this.isWishlish = false,
    this.leftPosition = 5,
  }) : super(key: key);

  final ProductModel product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlish;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 150,
            child: Image.network(product.imageUrl, fit: BoxFit.cover),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 70,
            left: leftPosition + 5,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor -
                  leftPosition -
                  10,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        Text(
                          "Rp ${product.price.toDouble()}",
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ],
                    ),
                    Spacer(),
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          splashColor: Colors.white,
                          child: BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              if(state is CartInitial){
                                return Center(child: CircularProgressIndicator(),);
                              }
                              if(state is CartLoaded){
                              return IconButton(
                                  onPressed: () {
                                    context.read<CartBloc>().add(CartProductAdded(product));
                                  },
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: Colors.white,
                                  ));
                              }
                              else{
                              return Center(child: Text("Something is Wrong"),);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    isWishlish
                        ? Expanded(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                splashColor: Colors.white,
                                child: BlocBuilder<WishlistBloc, WishlistState>(
                                  builder: (context, state) {
                                    return IconButton(
                                        onPressed: () {
                                          context.read<WishlistBloc>().add(
                                              RemoveWishListProduct(product));
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ));
                                  },
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
