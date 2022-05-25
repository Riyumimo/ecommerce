import 'package:ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/product_card.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => WishListScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "WishList",
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  
                  crossAxisCount: 1,
                  childAspectRatio: 2.4),
              itemCount: state.wishList.products.length,
              itemBuilder: (BuildContext context, int index) {
        
                return ProductCard(
                  product:state.wishList.products[index],
                  widthFactor: 1.1,
                  leftPosition: 100,
                  isWishlish: true,
                );
              },
            );
          } else {
            return Center(child: Text("Something went wrong"));
          }
        },
      ),
    );
  }
}
