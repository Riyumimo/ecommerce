import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Container(
    color: Colors.black,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(title,style: Theme.of(context).textTheme.headline3!.copyWith(
        color: Colors.white
      )),  
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [IconButton(onPressed: (){
        Navigator.pushNamed(context, '/wishlist');
      }, icon: Icon(Icons.favorite))],
      
    );
  }
  
  @override

  Size get preferredSize => Size.fromHeight(50);
}