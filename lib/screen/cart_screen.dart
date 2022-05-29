// ignore_for_file: prefer_const_constructors
import 'package:ecommerce/blocs/cart/cart_bloc.dart';
import 'package:ecommerce/widget/cart_product.dart';
import 'package:ecommerce/widget/custom_appbar.dart';
import 'package:ecommerce/widget/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';



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
                  OrderSummary()
                ],
              ));
            }
            return Text("Something is Wrong");
          },
        ));
  }
}
