import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/core/Shared/components.dart';
import 'package:untitled2/layouts/home/Widgets/cubit/shop_cubit.dart';
import 'package:untitled2/layouts/home/Widgets/cubit/shop_state.dart';
import 'package:untitled2/model/get_favorites/favorites_model.dart';

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
              child: buildFavoriteScreenItems(
                  context, cubit.favoritesModel!.data!.data![index]),
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

  Widget buildFavoriteScreenItems(
    context,
    FavoritesData? model,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model!.product!.image!),
                    height: 120,
                    width: 120,
                  ),
                  if (model.product!.discount != 0)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.red,
                      child: Text(
                        'discount'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            //product Image
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //product Name
                  Text(
                    model.product!.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 13, height: 1.5, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      //product Price
                      Text(
                        model.product!.price!.toString(),
                        style: const TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //product old Price
                      if (model.product!.discount != 0)
                        Text(
                          model.product!.oldPrice!.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.lineThrough,
                            decorationStyle: TextDecorationStyle.double,
                          ),
                        ),
                      // Icons.favorite_border
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changeFavorites(
                            model.product!.id,
                          );
                        },
                        icon: Icon(
                          ShopCubit.get(context).favorites[model.product!.id]
                              ? Icons.favorite_outlined
                              : Icons.favorite_border,
                          size: 25,
                          color: ShopCubit.get(context)
                                  .favorites[model.product!.id]
                              ? Colors.red
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
