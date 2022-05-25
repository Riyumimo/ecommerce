import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/models/catergory_models.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/custom_appbar.dart';
import '../widget/my_hero_carousel.dart';
import '../widget/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => HomeScreen(),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Home"),
      body: ListView(
        children: [
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enlargeCenterPage: true,
              ),
              items: Category.categories
                  .map((e) => MyHeroCarousel(category: e))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RECOMENDED',
                  style: GoogleFonts.poppins(),
                ),
                SizedBox(
                  height: 10,
                ),
                //Product Card
                ProductCarousel(
                    product: ProductModel.producst
                        .where((product) => product.isRecomended)
                        .toList()),
                Text(
                  'POPULAR',
                  style: GoogleFonts.poppins(),
                ),
                SizedBox(
                  height: 10,
                ),
                //Product Card
                ProductCarousel(
                    product: ProductModel.producst
                        .where((product) => product.isPopular)
                        .toList()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
