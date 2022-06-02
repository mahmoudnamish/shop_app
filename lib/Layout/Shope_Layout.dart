import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Layout/CubitShope/cubit_shope.dart';
import 'package:shop_app/Layout/CubitShope/States_Shope.dart';

import '../modules/search/Search.dart';


class ShopeHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitShope,ShopeStates>(
      listener: (context, state) {},
       builder:(context, state) {

        var Cubit = CubitShope.get(context);

        return Scaffold(appBar: AppBar(
          title: Text('Sallery'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
          }, icon: Icon (Icons.search,size: 30,))
        ],
        ),

          body:Cubit.BottomScreen[Cubit.Current],

          bottomNavigationBar: CurvedNavigationBar(
            height: 50,
            backgroundColor: Colors.grey,
            color: Colors.orangeAccent,
             index: Cubit.Current,
            onTap: (index){
             Cubit.ChangeBottom(index);
         },
         items: [
            Icon(Icons.home),
            Icon(Icons.apps),
            Icon(Icons.favorite),
            Icon(Icons.settings),

         ],

       ),

        );
    } ,
    );
  }
}
