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
          builder: (context) => buildProducts(cubit.homeModel!),
        );
      },
    );
  }

  Widget buildProducts(
    HomeModel? homeModel,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            items: homeModel?.data?.banners!
                .map((e) => Image(
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
          const SizedBox(height: 10),
          //build products Images
          Container(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 10,
                childAspectRatio: 1 / 1.5,
                children: List.generate(
                  homeModel!.data!.products!.length,
                  (index) => Column(
                    children: [
                      Image(
                        image: NetworkImage(
                            "${homeModel.data!.products![index].image}"),
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                      Text(
                        homeModel.data!.products![index].name!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          height: 1.5,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '${homeModel.data!.products![index].price!.round()}',
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 14,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
