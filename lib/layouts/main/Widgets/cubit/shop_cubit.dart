import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/features/categories/screen/categories_screen.dart';
import 'package:untitled2/features/favorites/screen/favorites_screen.dart';
import 'package:untitled2/features/products/screen/products_screen.dart';
import 'package:untitled2/features/settings/screen/settings_screen.dart';
import 'package:untitled2/layouts/main/Widgets/cubit/shop_state.dart';


class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitial());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens =
  [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),

  ];
  void changeBottom(int index ){
    currentIndex = index;
    emit(ChangeBottomNavState());

  }












}
