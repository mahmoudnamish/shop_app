import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/modules/OnBoardingScreen.dart';

class SplachScreen extends StatefulWidget {
 

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){Navigator.pushAndRemoveUntil(
        (context), MaterialPageRoute(builder: (context) => OnBoardingScreen()),
            (route) => true);},);
    
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Image.asset('assets/images/photo.png.webp'),

    ),);
  }
}
