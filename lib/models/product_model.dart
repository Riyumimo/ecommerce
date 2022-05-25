// ignore_for_file: prefer_const_constructors

import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecomended;
  final bool isPopular;

  const ProductModel(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.isRecomended,
      required this.isPopular,
      required this.price});

  @override
  List<Object?> get props =>  [name, category,imageUrl,price,isRecomended,isPopular];
  static List<ProductModel> producst =[
    ProductModel(name:"Coca Cola" , category: "SoftDrink", imageUrl: 
    "https://images.tokopedia.net/img/cache/700/product-1/2019/7/20/71160237/71160237_bbcb12c4-845f-4c98-bdb7-c0b7817fceb6_540_540",
     isRecomended: true, isPopular: true, price: 5600),

    ProductModel(name:"Sprite" , category: "SoftDrink", imageUrl: 
    "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/MTA-2166023/sprite_sprite_minuman_bersoda_-390_ml-_full02_mj60ryyu.jpeg",
     isRecomended: true, isPopular: true, price: 5600),

    ProductModel(name:"Fanta" , category: "SoftDrink", imageUrl: 
    "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//93/MTA-3464643/fanta_fanta-strawberry-can-minuman-ringan--330-ml-_full02.jpg",
     isRecomended: true, isPopular: true, price: 5600),

    ProductModel(name:"Shoyu ramen" , category: "Ramen", imageUrl: 
    "https://img-global.cpcdn.com/recipes/727a1a3e2dbd66b5/1200x630cq70/photo.jpg",
     isRecomended: true, isPopular: false, price: 26000),

    ProductModel(name:"Spicy Ramen" , category: "Ramen", imageUrl: 
    "https://myspicetrunk.com/wp-content/uploads/2021/04/WhatsApp-Image-2021-04-15-at-2.30.17-PM-e1618525005703.jpeg?v=1618524592",
     isRecomended: true, isPopular: false, price: 40000 ),

    ProductModel(name:"Wagashi Mochi" , category: "Dessert", imageUrl: 
    "https://asset.kompas.com/crops/89IMgIKuW8Dp_Cltf6ZVPLwT7yg=/48x0:974x617/750x500/data/photo/2020/07/19/5f13e0e1c1866.jpg",
     isRecomended: true, isPopular: false, price: 65000),
  ];
}
