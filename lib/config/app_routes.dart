
import 'package:ecommerce/models/catergory_models.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/screen/cart_screen.dart';
import 'package:ecommerce/screen/catalog_screen.dart';
import 'package:ecommerce/screen/home_screen.dart';
import 'package:ecommerce/screen/product_screen.dart';
import 'package:ecommerce/screen/wishlist_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route onGeneratorRoute(RouteSettings settings){
    switch(settings.name){
      case HomeScreen.routeName:
        return HomeScreen.route();
      case WishListScreen.routeName:
        return WishListScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);        
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as ProductModel);  
      case CartScreen.routeName:
        return CartScreen.route();      
      default: return _errorRoute();
    }

  }

  
}

 Route _errorRoute() {
  return MaterialPageRoute(
    settings: RouteSettings(name: '/error'),
    builder: 
  (context) => Scaffold(
    appBar: AppBar(title: Text("error"),)
  ),);
}