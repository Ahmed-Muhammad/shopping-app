import 'package:untitled2/model/change_favorites/change_favorites_model.dart';

abstract class ShopStates {}

class ShopInitial extends ShopStates {}

//----------Bottom Nav -----------------
class ChangeBottomNavState extends ShopStates {}

//---------------Home-------------------
class LoadingHomeDataState extends ShopStates {}

class SuccessHomeDataState extends ShopStates {}

class ErrorHomeDataState extends ShopStates {}

//--------------Categories------------------

class SuccessCategoriesState extends ShopStates {}

class ErrorCategoriesState extends ShopStates {}

//--------------Favorite------------------
//عملت state خاصه بتغير favorite
class ChangeFavoritesState extends ShopStates {}

class SuccessChangeFavoritesState extends ShopStates {
  //بعت object من model تغيير favorite الي main عشان بناءا علي Status اللي فيه انا هظهر رساله لل user لو حصل خطأ
  final ChangeFavoritesModel? model;

  SuccessChangeFavoritesState(this.model);
}

class ErrorChangeFavoritesState extends ShopStates {}

//--------------get favorites------------------
class ErrorGetFavoritesState extends ShopStates {}

class SuccessGetFavoritesState extends ShopStates {}

class LoadingGetFavoritesState extends ShopStates {}

//--------------get favorites------------------
class ErrorGetProfileState extends ShopStates {}

class SuccessGetProfileState extends ShopStates {}

class LoadingGetProfileState extends ShopStates {}



