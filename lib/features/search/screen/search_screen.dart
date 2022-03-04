import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/core/Shared/components.dart';
import 'package:untitled2/features/search/widgets/search_cubit.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        SearchCubit? cubit = SearchCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defaultFormField(
                    onSubmit: (text) {
                      print('before on Submit text ===> $text');
                      SearchCubit.get(context).search(searchText: text);
                      print('after on Submit text ===> $text');
                    },
                    type: TextInputType.text,
                    controller: searchController,
                    label: 'Type anything to search',
                    prefix: Icons.search,
                  ),

                  const SizedBox(height: 10),
                  ConditionalBuilder(
                    condition: state is SearchLoadingState,
                    builder: (context) => const LinearProgressIndicator(),
                    fallback: (context) => Container(),
                  ),
                  const SizedBox(height: 10),
                  ConditionalBuilder(
                    condition: state is SearchSuccessState,
                    builder: (context) => Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return buildSearchProduct(
                            context,
                            cubit.searchModel!.data!.data![index],
                            isOldPrice: false,
                          );
                        },
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount:cubit.searchModel!.data!.data!.length,
                      ),
                    ),
                    fallback: (context) => Container(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildSearchProduct(context, model, {bool isOldPrice = true}) {
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
                    image: NetworkImage(model.image),
                    height: 120,
                    width: 120,
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
                    model.name,
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
                        model.price.toString(),
                        style: const TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //product old Price

                      const Spacer(),
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
