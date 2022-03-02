import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/core/Shared/components.dart';
import 'package:untitled2/layouts/home/Widgets/cubit/shop_cubit.dart';
import 'package:untitled2/layouts/home/Widgets/cubit/shop_state.dart';
import 'package:untitled2/model/categories/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) =>
              buildCategoriesItem(cubit.categoriesModel!.data!.data![index]),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: cubit.categoriesModel!.data!.data!.length,
        );
      },
    );
  }
}

Widget buildCategoriesItem(CategoriesDataInfo categoriesDataInfo) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children:  [
          Image(
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            image: NetworkImage(categoriesDataInfo.image!),
          ),
          const SizedBox(
            width: 20,
          ),
           Text(
             categoriesDataInfo.name!.toCapitalized(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_outlined)
        ],
      ),
    );
