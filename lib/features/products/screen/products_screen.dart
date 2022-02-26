import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/layouts/home/Widgets/cubit/shop_cubit.dart';
import 'package:untitled2/layouts/home/Widgets/cubit/shop_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled2/model/home/home_model.dart';

import '../../../core/Shared/components.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: cubit.homeModel != null,
          fallback: (context) => progress(context),
          builder: (context) => buildProductsScreen(cubit.homeModel!),
        );
      },
    );
  }


  //------------------Build Products Screen----------------
  Widget buildProductsScreen(HomeModel homeModel) {
    return Column(
      children: [
        buildBanners(homeModel),

      ],
    );
  }

  //------------------build Banners images using Images Slider----------------
  Widget buildBanners(homeModel)=> CarouselSlider(
    items: homeModel.data?.banners!.map((e) => Image(
      image: NetworkImage("${e.image}"),
      width: double.infinity,
      fit: BoxFit.cover,
    )).toList(),
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
  );
}
