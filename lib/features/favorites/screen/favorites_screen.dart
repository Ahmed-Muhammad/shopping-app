import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/core/Shared/components.dart';
import 'package:untitled2/layouts/home/Widgets/cubit/shop_cubit.dart';
import 'package:untitled2/layouts/home/Widgets/cubit/shop_state.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCubit? cubit = ShopCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.favoritesModel!.data!.data!.isNotEmpty,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
              onDismissed: (direction) {
                ShopCubit.get(context).changeFavorites(
                  cubit.favoritesModel!.data!.data![index].product!.id,
                );
              },
              child: buildListProduct(context, model: cubit.favoritesModel!.data!.data![index]),
            ),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: cubit.favoritesModel!.data!.data!.length,
          ),
          fallback: (context) => const Center(
            child: Text(
              "You don't have any favorites yet ! \n "
              "Add some.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }


}
