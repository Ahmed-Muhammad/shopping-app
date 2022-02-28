import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/layouts/home/Widgets/cubit/shop_cubit.dart';
import 'package:untitled2/layouts/home/Widgets/cubit/shop_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled2/model/categories/categories_model.dart';
import 'package:untitled2/model/home/home_model.dart';

import '../../../core/Shared/components.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        //عملت حاله انه لو state هي اني تمام غيرت قيمه favorite في ال map
        // وكانت حاله تغير favorite هي false في API  اطلع رساله الي ال user بأن في خطأ حصل
        if (state is SuccessChangeFavoritesState)
        {
          if (state.model!.status == false)
          {
            showToast(message: state.model!.message, state: ToastStates.error);

          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: cubit.homeModel != null && cubit.categoriesModel != null,
          fallback: (context) => progress(context),
          builder: (context) =>
              buildProducts(cubit.homeModel!, cubit.categoriesModel!, context),
        );
      },
    );
  }

  Widget buildProducts(HomeModel? homeModel,
      CategoriesModel? categoriesModel,
      context,) =>
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: homeModel?.data?.banners!
                  .map((e) =>
                  Image(
                    image: NetworkImage("${e.image}"),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ))
                  .toList(),
              options: CarouselOptions(
                height: 225,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                      const SizedBox(
                        width: 10,
                      ),
                      itemCount: categoriesModel!.data!.data!.length,
                      itemBuilder: (context, index) =>
                          buildCategoryItems(
                              categoriesModel.data!.data![index]),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'New Products',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 1.5,
                  childAspectRatio: 1 / 1.52,
                  children: List.generate(
                    homeModel!.data!.products!.length,
                        (index) {
                      return Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                Image(
                                  image: NetworkImage(
                                      "${homeModel.data!.products![index]
                                          .image}"),
                                  height: 200,
                                  width: double.infinity,
                                ),
                                if (homeModel.data!.products![index].discount !=
                                    0)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
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
                            ), //product Image
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //product Name
                                  Text(
                                    homeModel.data!.products![index].name!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        height: 1.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      //product Price
                                      Text(
                                        '${homeModel.data!.products![index]
                                            .price!.round()}',
                                        style: const TextStyle(
                                            color: Colors.deepPurple,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      //product old Price
                                      if (homeModel.data!.products![index]
                                          .discount !=
                                          0)
                                        Text(
                                          '${homeModel.data!.products![index]
                                              .oldPrice.round()}',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                            TextDecoration.lineThrough,
                                            decorationStyle:
                                            TextDecorationStyle.double,
                                          ),
                                        ),
                                      // Icons.favorite_border
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          ShopCubit.get(context)
                                              .changeFavorites(
                                            homeModel.data!.products![index].id,
                                          );
                                        },
                                        icon: Icon(
                                          ShopCubit
                                              .get(context)
                                              .favorites[
                                          homeModel.data!
                                              .products![index].id]
                                              ? Icons.favorite_outlined
                                              : Icons.favorite_border,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ), //build products Images
          ],
        ),
      );

  Widget buildCategoryItems(CategoriesDataInfo? categoriesDataInfo) =>
      SizedBox(
        height: 100,
        width: 100,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image(
              image: NetworkImage(categoriesDataInfo!.image!),
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(.8),
              width: double.infinity,
              child: Text(
                categoriesDataInfo.name!.toCapitalized(),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
}
