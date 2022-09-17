import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Icon(Icons.menu) ,
        title: Image(image: AssetImage('assets/images/co_design_logo_for_app_bar_removed_background.png'),),
        actions: [
          Icon(Icons.notifications),
        ],
      ),
    );
  }
}
