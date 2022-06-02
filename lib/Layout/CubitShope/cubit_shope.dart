

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/Layout/CubitShope/States_Shope.dart';
import 'package:shop_app/Network/remote/Dio_Helper.dart';
import 'package:shop_app/Shared/Components/Constance.dart';
import 'package:shop_app/modeles/Shop_Modeles/categories_modeles.dart';
import 'package:shop_app/modules/cateogries/Cateogries.dart';
import 'package:shop_app/modules/favorites/Favorites.dart';
import 'package:shop_app/modules/products/Products.dart';
import 'package:shop_app/modules/setting/Setting.dart';

import '../../Network/End_points.dart';
import '../../modeles/Shop_Modeles/home_modeles.dart';

class CubitShope extends Cubit<ShopeStates> {
  CubitShope() : super(InitialState());

  static  CubitShope get(context) => BlocProvider.of(context);

  int Current = 0;

  List<Widget> BottomScreen = [
    ProductsScreen(),
    CateogriesScreen(),
    FavoritesScreen(),
    SettingScreen()
  ];

  void ChangeBottom(int index) {
    Current = index;
    emit(ChangebottomNavigateState());
  }


 ShopeHomemodeles ?homemodele;

  void getHomeData() {
    emit(ShopHomeLodingState());
    DioHelper.getData(
      url: Home,
      token: token,
    ).then((value) {
      homemodele = ShopeHomemodeles.Fromejson(value.data!);
      emit(ShopHomeSuccessState());
      // أسماء الملفات بتكون lower case
    }).catchError((error) {
      print('error when getHomeData: ${error.toString()}');
      emit(ShopHomeErrorState(error.toString()));
    });
  }
   Categoriesmodele? categoriesmodele;

  void getcategoriesData() {
    DioHelper.getData(
      url: categories,
      token: token,
    ).then((value) {
      categoriesmodele = Categoriesmodele.fromjson(value.data!);
      emit(categoriesSuccessState());
      // أسماء الملفات بتكون lower case
    }).catchError((error) {
      print('error when categoriesHomeData: ${error.toString()}');
      emit(categoriesErrorState(error.toString()));
    });
  }
}
