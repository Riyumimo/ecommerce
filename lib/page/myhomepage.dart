// ignore_for_file: unused_field, prefer_final_fields

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ecommerce/screen/cart_screen.dart';
import 'package:flutter/material.dart';

import '../screen/home_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   int _selectedIndex = 0;
  int _counter = 0;
   PageController _pageController=PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: <Widget>[
            const HomeScreen(),
            const CartScreen(),
            Container(color: Colors.green,),
            Container(color: Colors.blue,),
          ],
        ),
      ),
      bottomNavigationBar: 
      BottomNavigationBar()
    );
  }


  // ignore: non_constant_identifier_names
  BottomNavyBar BottomNavigationBar() {
    return BottomNavyBar(
      containerHeight: 70,
      backgroundColor: Colors.black,
      selectedIndex: _selectedIndex,
      showElevation: false, // use this to remove appBar's elevation
      onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }),
 items: [
   BottomNavyBarItem(
     icon: const Icon(Icons.apps),
     title: const Text('Home'),
     activeColor: Colors.white,
   ),
   BottomNavyBarItem(
       icon: const Icon(Icons.shopping_cart_outlined),
       title: const Text('Cart'),
       activeColor: Colors.white,
   ),
   
   BottomNavyBarItem(
       icon: const Icon(Icons.settings),
       title: const Text('Settings'),
       activeColor: Colors.white,
      
   ),
 ],
);
  }
}

