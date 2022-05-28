// ignore_for_file: prefer_const_constructors
import 'package:ecommerce/widget/cart_product.dart';
import 'package:ecommerce/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: "Cart"),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return (Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Add \$20 for FREE Delevery",
                                style: GoogleFonts.julee(
                                  fontSize: 16,
                                )),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 0,
                              ),
                              child: Text("Add More Items"),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 390,
                          child: ListView.builder(
                            itemCount: state.cart
                                .productQuantity(state.cart.producst)
                                .keys
                                .length,
                            itemBuilder: (BuildContext context, int index) {
                              return CartProductCard(
                                  productModel: state.cart
                                      .productQuantity(state.cart.producst)
                                      .keys
                                      .elementAt(index),
                                  quantity: state.cart
                                      .productQuantity(state.cart.producst)
                                      .values
                                      .elementAt(index));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "DELEVERY FEE",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(state.cart.deleveryFeeString,
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "SUB TOTAL",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text("${state.cart.subtotalString}",
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(50)),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.all(5.0),
                              height: 50,
                              decoration: BoxDecoration(color: Colors.black),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "TOTAL",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ),
                                    Text(state.cart.totalString,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black87,
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width, 50)),
                              onPressed: () {},
                              child: Text("Pay Now")),
                        )
                      ],
                    ),
                  )
                ],
              ));
            }
            return Text("Something is Wrong");
          },
        ));
  }
}
