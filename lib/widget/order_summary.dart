import 'package:ecommerce/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return Column(
            children: [
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
                          decoration:
                              BoxDecoration(color: Colors.black.withAlpha(50)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(5.0),
                          height: 50,
                          decoration: BoxDecoration(color: Colors.black),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "TOTAL",
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
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
                              fixedSize:
                                  Size(MediaQuery.of(context).size.width, 50)),
                          onPressed: () {},
                          child: Text("Pay Now")),
                    )
                  ],
                ),
              )
            ],
          );
        } else {
          return Center(child: Text("Smoething Went wrong"));
        }
      },
    );
  }
}
