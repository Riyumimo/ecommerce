import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/widget/custom_appbar.dart';
import 'package:ecommerce/widget/my_hero_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/bloc/cart_bloc.dart';
import '../models/catergory_models.dart';

class ProductScreen extends StatelessWidget {
  final ProductModel product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);
  static const String routeName = '/product';
  static Route route({required ProductModel product}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: ((context) => ProductScreen(
              product: product,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: product.name),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black.withOpacity(0.9),
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    )),
                BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () {
                          context
                              .read<WishlistBloc>()
                              .add(AddWishListProduct(product));
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ));
                  },
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {
                          context.read<CartBloc>().add(CartProductAdded(product));
                          Navigator.pushNamed(context, '/cart');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Add To Chart",
                            style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ));
                  },
                )
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: [MyHeroCarousel(product: product)],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          product.name,
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        Text(
                          "Rp ${product.price.toString()}",
                          style: GoogleFonts.poppins(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                title: Text(
                  "Product Infotmation",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                children: [
                  ListTile(
                    title: Text(
                        "Aliqua commodo elit tempor dolor est. Et enim consequat cillum commodo cillum. Consequat elit pariatur labore elit esse dolor est  do excepteur esse voluptate cillum ex commodo eu cillum ea id. Veniam ut laboris ea incididunt quis et occaecat sint eu ipsum anim. Velit et voluptate reprehenderit aliquip Lorem occaecat laboris sunt laborum ut irure reprehenderit. Laboris quis enim aliquip aliquip in irure mollit aute. Voluptate commodo dolor sunt eiusmod fugiat et veniam laboris nisi consectetur et tempor. Labore anim ut dolore ad id deserunt tempor laborum aute ex ex occaecat et."),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                title: Text(
                  "Delevery Infotmation",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                children: [
                  ListTile(
                    title: Text(
                        "Aliqua commodo elit tempor dolor est. Et enim consequat cillum commodo cillum. Consequat elit pariatur labore elit esse dolor est  do excepteur esse voluptate cillum ex commodo eu cillum ea id. Veniam ut laboris ea incididunt quis et occaecat sint eu ipsum anim. Velit et voluptate reprehenderit aliquip Lorem occaecat laboris sunt laborum ut irure reprehenderit. Laboris quis enim aliquip aliquip in irure mollit aute. Voluptate commodo dolor sunt eiusmod fugiat et veniam laboris nisi consectetur et tempor. Labore anim ut dolore ad id deserunt tempor laborum aute ex ex occaecat et."),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
