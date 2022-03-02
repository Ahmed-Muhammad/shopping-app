import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/core/Shared/constant.dart';
import 'package:untitled2/core/web/API/dio_helper.dart';
import 'package:untitled2/core/web/end_points.dart';
import 'package:untitled2/features/categories/screen/categories_screen.dart';
import 'package:untitled2/features/favorites/screen/favorites_screen.dart';
import 'package:untitled2/features/products/screen/products_screen.dart';

import 'package:untitled2/layouts/home/Widgets/cubit/shop_state.dart';
import 'package:untitled2/model/categories/categories_model.dart';
import 'package:untitled2/model/home/home_model.dart';

import '../../../../model/change_favorites/change_favorites_model.dart';
import '../../../../model/get_favorites/favorites_model.dart';
import '../../../../model/login/login_model.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitial());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

//----------------------------get Home Data-----------
  HomeModel? homeModel;

  //عملت map عشان احط فيها ال product اللي معمولهم favorite
  // واعرف هم ايه بالظبط عشان ابقي اعرضهم في favorite screen
  Map<dynamic, dynamic> favorites = {};

  void getHomeData() {
    emit(LoadingHomeDataState());
    DioHelper.getData(
      url: Home,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      //add product to favorite List To use it later for Favorite screen

      homeModel!.data!.products?.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });
      print(favorites.toString());
      emit(SuccessHomeDataState());
    }).catchError((error) {
      print('Error in GetHomeData is  =======> ${error.toString()}');

      emit(ErrorHomeDataState());
    });
    emit(LoadingHomeDataState());
  }

//----------------------------get Categories-----------
  CategoriesModel? categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: CATEGORIES,
      lang: 'en',
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(SuccessCategoriesState());
    }).catchError((error) {
      print('Error in Get Categories ==========> ${error.toString()}');
      emit(ErrorCategoriesState());
    });
  }

//----------------------------Change favorite on and off --------------

  ChangeFavoritesModel? changeFavoritesModel;

//بناءا علي قيمه id بتاع product انا بحدد ايه item اللي معمول له favorite
//وبعد كدا بغير شكل ايقونه favorite في product screen اعتمادا علي method دي ...
  void changeFavorites(int? productId) {
    //هنا بخلي ال map اللي انا عملتها فوق تتحدث كلما اضغط علي favorite icon button
    // اللي انا عاملها في product screen
    //بمعني اني
    //لما بضغط علي ال button المفروض ان product بيطحط في map علي انه يا اما favorite يا اما مش favorite
    //انا هنا بقي خليط اي product اللي محطوط في map يتعمل في وقتها real time بدل ما اعمل reload لل app كله
    //وبعد كدا عملت emit عشان تتغير لحظي قدام عيني , وهيكمل الكود ويروح يحطها في map بعد كدا في background
    favorites[productId] = !favorites[productId];

    // عملت status ليها مخصوص عشان احدث قيمه المنتجات مباشره
    emit(ChangeFavoritesState());

    DioHelper.postData(
      url: FAVORITE,
      data: {'product_id': productId},
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);

      // عملت حساب ان لو في مشكله في product انه مش قابل انه ينضاف لل favorite بسبب خطأ ما يقوم يرجع يشيله من map تلقائيا
      //ويرجع شكل icon زي ما كان
      if (changeFavoritesModel?.status == false) {
        favorites[productId] = !favorites[productId];

        //حطيت دا هنا عشان احدث صفحه favorite بعدما اشيل او احط اي product فيها
      } else {
        getFavorites();
      }

      emit(SuccessChangeFavoritesState(changeFavoritesModel));
    }).catchError((onError) {
      favorites[productId] = !favorites[productId];
      emit(ErrorChangeFavoritesState());
    });
  }

//----------------------------Change favorite on and off --------------
  FavoritesModel? favoritesModel;

  void getFavorites() {
    emit(LoadingGetFavoritesState());
    DioHelper.getData(
      url: FAVORITE,
      token: token,
      lang: 'en',
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      emit(SuccessGetFavoritesState());
    }).catchError((onError) {
      emit(ErrorGetFavoritesState());
    });
  }

//----------------------------Get profile--------------

  LoginModel? profileModel ;
  void getProfile() {
    emit(LoadingGetProfileState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
      lang: 'en',
    ).then((value) {
      profileModel = LoginModel.fromJson(value.data);
      print(profileModel?.data);

      emit(SuccessGetProfileState());
    }).catchError((onError) {
      emit(ErrorGetProfileState());
      print(onError.toString());
    });
  }
}
