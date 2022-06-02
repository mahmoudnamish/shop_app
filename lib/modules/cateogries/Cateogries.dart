import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/cateogries/Cubit/categories_states.dart';

import '../../modeles/Shop_Modeles/categories_modeles.dart';
import 'Cubit/categories_cubit.dart';

class CateogriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit,categoriesState>(
      listener: (context,state){},
        builder:(context,state){

          var Cubit = CategoriesCubit.get(context);
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>buildScreen(Cubit.categoriesmodele!.data!.data[index])
            , separatorBuilder: (context,index)=>SizedBox(height: 15)
            , itemCount: Cubit.categoriesmodele!.data!.data.length);
        }

    );
  }




  Widget buildScreen(Data  modele)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(children: [
      Image(image: NetworkImage(
          modele.image!),
          fit: BoxFit.cover, width: 120, height: 120),
      SizedBox(width: 10),
      Text(modele.name!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
      Spacer(),
      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
      ,

    ],),
  );
}