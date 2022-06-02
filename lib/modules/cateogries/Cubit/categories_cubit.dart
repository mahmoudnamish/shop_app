
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Network/End_points.dart';
import 'package:shop_app/Network/remote/Dio_Helper.dart';
import 'package:shop_app/modules/cateogries/Cubit/categories_states.dart';

import '../../../Shared/Components/Constance.dart';
import '../../../modeles/Shop_Modeles/categories_modeles.dart';

class  CategoriesCubit extends Cubit<categoriesState>{
  CategoriesCubit() : super(Initialestate());

  static CategoriesCubit get(context)=>BlocProvider.of(context);
  Categoriesmodele? categoriesmodele;
  void getcategoriesData() {
    DioHelper.getData(
      url: categories,
      token: token,
    ).then((value) {
      categoriesmodele = Categoriesmodele.fromjson(value.data!);
      emit(successtate());
      // أسماء الملفات بتكون lower case
    }).catchError((error) {
      print('error when categoriesHomeData: ${error.toString()}');
      emit(errorstate(error.toString()));
    });
  }

}