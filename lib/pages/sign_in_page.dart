import 'package:flutter/material.dart';

class signInPage extends StatefulWidget {
  const signInPage({Key? key}) : super(key: key);

  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {},
            child: Row(
              children: [
                Image(
                  image: AssetImage(
                    'assets/images/facebook_logo_icon.png',
                  ),
                  width: 29,
                  height: 29,
                ),
                SizedBox(width: 11,),
                Text('Facebook',style:TextStyle(color: Colors.white,fontSize:18,),),
              ],
            ),
            color: Color(0xf1877F2),
          ),
          SizedBox(height: 24,),
          MaterialButton(
            onPressed: () {},
            child: Row(
              children: [
                Image(
                  image: AssetImage(
                    'assets/images/google_logo_icon.png',
                  ),
                  width: 29,
                  height: 29,
                ),
                SizedBox(width: 14,),
                Text('Google Account',style:TextStyle(fontSize:15,),),
              ],
            ),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
