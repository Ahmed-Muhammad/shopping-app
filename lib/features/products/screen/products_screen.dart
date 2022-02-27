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
      physics: const BouncingScrollPhysics(),
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
                mainAxisSpacing: 2,
                crossAxisSpacing: 1.5,
                childAspectRatio: 1 / 1.52,
                children: List.generate(
                  homeModel!.data!.products!.length,
                  (index) => Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Image(
                              image: NetworkImage(
                                  "${homeModel.data!.products![index].image}"),
                              height: 200,
                              width: double.infinity,
                            ),
                            if (homeModel.data!.products![index].discount != 0)
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
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
                                    '${homeModel.data!.products![index].price!.round()}',
                                    style: const TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  //product old Price
                                  if (homeModel
                                          .data!.products![index].discount !=
                                      0)
                                    Text(
                                      '${homeModel.data!.products![index].oldPrice.round()}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.lineThrough,
                                        decorationStyle:
                                            TextDecorationStyle.double,
                                      ),
                                    ),
                                  const Spacer(),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      //TODO  IconButton onPressed
                                    },
                                    icon: const Icon(
                                      Icons.favorite_border_rounded,
                                      size: 15,
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
