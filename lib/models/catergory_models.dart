import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({required this.name, required this.imageUrl});

  @override
  // TODO: implement props
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    Category(
        name: "SoftDrink",
        imageUrl:
            "https://cdn-2.tstatic.net/jabar/foto/bank/images/ilustrasi-soft-drink-ilustrasi-minuman-ringan-ilustrasi-minuman-bersoda_20180719_084159.jpg")
  ,
    Category(
        name: "Burger",
        imageUrl:
            "https://storage.googleapis.com/cdn-1.pintaria.com/wp/roti-burger-Pintaria-200806023904.jpg")
  ,
    Category(
        name: "Pizza",
        imageUrl:
            "https://cdn0-production-images-kly.akamaized.net/csA_SI3t-Hy4T6CrLzhr4xN0x6w=/1200x1200/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3147700/original/057328300_1591684921-Ilustrasi_Pizza.jpg")
  ,
    Category(
        name: "Apple",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQK_j97vCXtnBqYNT6rOmD-tKjjKOigu6tIQ&usqp=CAU")
  ,
    Category(
        name: "Ramen",
        imageUrl:
            "https://foto.kontan.co.id/0tjuvhnS6BdUogJx3doAt_S2G-4=/smart/2022/01/04/1699948150p.jpg")
  ,
    Category(
        name: "Wagashi",
        imageUrl:
            "https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/00/a0000043/img/basic/a0000043_main.jpg?20200619184202&q=80&rw=750&rh=536")
  ,
  ];
}
