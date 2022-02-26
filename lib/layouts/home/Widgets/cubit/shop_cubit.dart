import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/core/Shared/constant.dart';
import 'package:untitled2/core/web/API/dio_helper.dart';
import 'package:untitled2/core/web/end_points.dart';
import 'package:untitled2/features/categories/screen/categories_screen.dart';
import 'package:untitled2/features/favorites/screen/favorites_screen.dart';
import 'package:untitled2/features/products/screen/products_screen.dart';
import 'package:untitled2/features/settings/screen/settings_screen.dart';
import 'package:untitled2/layouts/home/Widgets/cubit/shop_state.dart';
import 'package:untitled2/model/home/home_model.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitial());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

//----------------------------get Home Data-----------
  HomeModel? homeModel;

  void getHomeData() {
    emit(LoadingHomeDataState());

    DioHelper.getData(
      url: Home,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      // print(homeModel?.data?.banners![0].image);
      //      print(homeModel?.status);
      emit(SuccessHomeDataState());
    }).catchError((error) {
      print('Error in GetHomeData is  =======> ${error.toString()}');

      emit(ErrorHomeDataState());
    });
    emit(LoadingHomeDataState());
  }
}
