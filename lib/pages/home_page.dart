import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image(image: AssetImage('assets/images/co_design_logo_for_app_bar_removed_background.png') ,height: 100,),
        actions: [
          IconButton(icon:Icon(Icons.notifications) , onPressed: (){}, ),
        ],
      ),
      drawer: Drawer(),
     floatingActionButton: FloatingActionButton(onPressed: (){} , child:Icon(Icons.chat),backgroundColor: Colors.purple,),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, //tagroba
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.blue,
          items:  [
        BottomNavigationBarItem(icon:Icon(Icons.account_circle),label:'Profile'),
        BottomNavigationBarItem(icon:Icon(Icons.wallet_sharp),label:'Wallet'),
        BottomNavigationBarItem(icon:Icon(Icons.home),label:'Home'),
        BottomNavigationBarItem(icon:Icon(Icons.shopping_cart_rounded),label:'Cart'),
        BottomNavigationBarItem(icon:Icon(Icons.search),label:'Search'),
      ],
      onTap: _changeItem,
      ),
        );
  }

  void _changeItem(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
