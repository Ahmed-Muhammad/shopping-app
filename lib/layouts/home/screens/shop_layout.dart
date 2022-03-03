import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/core/Shared/components.dart';
import 'package:untitled2/features/search/screen/search_screen.dart';
import 'package:untitled2/layouts/home/Widgets/cubit/shop_cubit.dart';
import 'package:untitled2/layouts/home/Widgets/cubit/shop_state.dart';

import '../Widgets/Side Bar/my_drawer.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'El-Wekala',
            ),
            centerTitle: true,
            actions: [
              //search screen icon
              IconButton(
                onPressed: () => navigateTo(
                  context,
                   SearchScreen(),
                ),
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottom(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'Favorites',
              ),

            ],
          ),
          drawer: const MyDrawer(),
        );
      },
    );
  }
}
