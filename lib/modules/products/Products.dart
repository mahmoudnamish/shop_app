import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Layout/CubitShope/cubit_shope.dart';
import 'package:shop_app/Layout/CubitShope/States_Shope.dart';

import '../../modeles/Shop_Modeles/categories_modeles.dart';
import '../../modeles/Shop_Modeles/home_modeles.dart';

class ProductsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitShope,ShopeStates>(
        listener: (context, state) {},
         builder: (context, state) {
          var Cubit=CubitShope.get(context);
          return ConditionalBuilder(
            condition:Cubit.homemodele!= null&&Cubit.categoriesmodele!=null ,
            builder:(context)=>ProductBuilder(Cubit.homemodele!, Cubit.categoriesmodele!) ,
            fallback: (context)=>Center(child: CircularProgressIndicator()),

          );

         },

    );

  }
}

Widget ProductBuilder(ShopeHomemodeles modele, Categoriesmodele categories)=>
    SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        CarouselSlider(items: modele.data!.banners.map((e) =>
            Image(image: NetworkImage('${e.image}'),
              width: double.infinity,
          fit: BoxFit.contain,
        ),).toList(), options: CarouselOptions(
              height: 300,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval:Duration(seconds: 3),
              autoPlayAnimationDuration:Duration(seconds: 1),
              autoPlayCurve:Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal
            )),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w800),),
                  SizedBox(height: 10,),
       Container(
               height: 100,
               child: ListView.separated(
                 physics: BouncingScrollPhysics(),
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context, index) => buildCategories(categories.data!.data[index])
                   , separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: categories.data!.data.length),
       ),
              SizedBox(height: 10,),
                  Text('NewProducts',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w800),),
                  SizedBox(height: 10,),
              Container(
                color: Colors.grey[300],
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount:2,
                 crossAxisSpacing: 3.0,
                 mainAxisSpacing: 2.0,
                childAspectRatio: 1/1.6,
                children:List.generate(modele.data!.products.length,
                 (index) => buildGridProduct(modele.data!.products[index])
                ) ,
                ),
              ),
            ],
          ),
        )
      ]),
    );
Widget buildGridProduct(productsmodele modele)=>  Container(
  color: Colors.white,
  child:   Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

    Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Image(image: NetworkImage(

            modele.image!,

        ),width: double.infinity,fit: BoxFit.contain,height: 200,

        ),
        if(modele.discount!=0)
        Container(
          padding:  EdgeInsets.symmetric(horizontal: 5),
          color: Colors.red,
          child: Text('Discount',style: TextStyle(color: Colors.white,fontSize:15),),)
      ],
    ),

    Text(modele.name!,overflow:TextOverflow.ellipsis,

    maxLines: 2,style: TextStyle(fontSize: 14,height: 1.3),

    ),

    Row(

      children: [

        Text('${modele.price.round()}',

        style: TextStyle(fontSize: 15,color: Colors.blueAccent),

        ),

        SizedBox(width: 10,),
          if(modele.discount!=0)
        Text('${modele.old_price.round()}',

          style: TextStyle(fontSize: 13,color: Colors.grey,



          decoration: TextDecoration.lineThrough

          ),

        ),
        Spacer(),
        IconButton(onPressed: (){}, icon: Icon (Icons.favorite_border,size: 17,))

      ],

    )



  ],),
);

Widget  buildCategories(Data modele)=>Stack(
  alignment: AlignmentDirectional.bottomCenter,
  children: [
    Image(image: NetworkImage(modele.image!),
      fit: BoxFit.cover,height: 100,width: 100,),
    Container(
        width: 100,
        color: Colors.black.withOpacity(.6),
        child: Text(modele.name!,style: TextStyle(fontSize: 18,color: Colors.white,)
          ,textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,)),

  ],);