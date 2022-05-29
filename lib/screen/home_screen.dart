import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/models/catergory_models.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../blocs/category/category_bloc.dart';
import '../blocs/products/product_bloc.dart';
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
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enlargeCenterPage: true,
                    ),
                    items: state.categories
                        .map((e) => MyHeroCarousel(category: e))
                        .toList(),
                  );
                } else {
                  return Center(
                    child: Text("Something is Wrong"),
                  );
                }
              },
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
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if(state is ProductLoading){
                      return Center(child: CircularProgressIndicator(),);
                    }if(state is ProductLoaded){

                    return ProductCarousel(
                        product: state.producst
                            .where((product) => product.isRecomended)
                            .toList());
                    }
                    else{
                      return Center(child:  Text("Something is wrong"),);
                    }
                  },
                ),
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if(state is ProductLoading){
                      return Center(child: CircularProgressIndicator(),);
                    }if(state is ProductLoaded){

                    return ProductCarousel(
                        product: state.producst
                            .where((product) => product.isPopular)
                            .toList());
                    }
                    else{
                      return Center(child:  Text("Something is wrong"),);
                    }
                  },
                ),
             
              ],
            ),
          )
        ],
      ),
    );
  }
}
