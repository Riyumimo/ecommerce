
import 'package:ecommerce/blocs/cart/cart_bloc.dart';
import 'package:ecommerce/blocs/category/category_bloc.dart';
import 'package:ecommerce/blocs/products/product_bloc.dart';
import 'package:ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/config/app_routes.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/page/myhomepage.dart';
import 'package:ecommerce/page/splash_screen_page.dart';
import 'package:ecommerce/repositories/category/category_repositories.dart';
import 'package:ecommerce/repositories/product/product_repositories.dart';
import 'package:ecommerce/screen/checkout_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WishlistBloc()..add(StartWishList()),
        ),
        BlocProvider(
          create: (context) => CartBloc()..add((LoadCart())),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(categoryRepository: CategoryRepository())..add(LoadCategories())),

          BlocProvider(
            create: (context) => ProductBloc(productsRepository: ProductRepository())..add(LoadProducts()),
          ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute.onGeneratorRoute,
        initialRoute: CheckoutScreen.routeName,
      ),
    );
  }
}
