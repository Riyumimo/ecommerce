import 'package:ecommerce/models/catergory_models.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/widget/custom_appbar.dart';
import 'package:ecommerce/widget/product_card.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({required this.category, Key? key}) : super(key: key);
  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: ((context) => CatalogScreen(
              category: category,
            )));
  }

  final Category category;

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> categoryProduct = ProductModel.producst
        .where((element) => element.category == category.name)
        .toList();
    // CatalogScreen.route(category: ModalRoute.of(context)!.settings.arguments as Category);
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 50,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          
          childAspectRatio: 1.15
        ),
        itemCount:categoryProduct.length,
        itemBuilder: (BuildContext context, int index) {
          // if(categoryProduct.length == 0){
          //   return Center(child:Text("Data is empity"));

          // }
          return ProductCard(
            product: categoryProduct[index],
            widthFactor: 2.5,
          );
        },
      ),
    );
  }
}
