import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Layout/CubitShope/cubit_shope.dart';
import 'package:shop_app/Layout/Shope_Layout.dart';
import 'package:shop_app/Network/local/Cach_Helper.dart';
import 'package:shop_app/Network/remote/Dio_Helper.dart';
import 'package:shop_app/Shared/Components/Constance.dart';
import 'package:shop_app/modules/LoginScreen/Cubit/cubit_login.dart';
import 'package:shop_app/modules/LoginScreen/Cubit/states_login.dart';
import 'package:shop_app/modules/OnBoardingScreen.dart';
import 'Shared/Components/Style.dart';
import 'modules/LoginScreen/Login_Screen.dart';
import 'modules/cateogries/Cubit/categories_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  DioHelper.init();

  Widget widget;
  bool ?onbording = CachHelper.getData(key: "OnBoardingScreen");
   token = CachHelper.getData(key: "token");

  if (onbording != null) {
    if (token != null)
      widget = ShopeHomeScreen();
    else
      widget = LoginScreen();
  } else {
    widget = OnBoardingScreen();
  }
  print(onbording);

  runApp(MyApp(onbording: onbording, StartWidget: widget));
}

class MyApp extends StatelessWidget {
  bool? onbording;
  Widget? StartWidget;

  MyApp({this.onbording, this.StartWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CountCubit(),
        ),
        BlocProvider(
          create: (context) => CubitShope()..getHomeData()..getcategoriesData(),
        ),

        BlocProvider(create: (context)=>CategoriesCubit()..getcategoriesData())
      ],
      child: BlocConsumer<CountCubit, CountStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: themelight,
            debugShowCheckedModeBanner: false,
            home: StartWidget,
          );
        },
      ),
    );
  }
}
