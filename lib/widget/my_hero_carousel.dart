import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/catergory_models.dart';

class MyHeroCarousel extends StatelessWidget {
  const MyHeroCarousel(
      { this.category,  this.product, Key? key})
      : super(key: key);
  final Category? category;
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.product == null) {}
        Navigator.of(context).pushNamed("/catalog", arguments: category);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(const Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(product == null? category!.imageUrl:product!.imageUrl,
                    fit: BoxFit.fill, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      product == null? category!.name: "",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
