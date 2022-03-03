import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/core/Shared/components.dart';
import 'package:untitled2/features/search/widgets/search_cubit.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();

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
                   onSubmit: (text){
                     text = searchController.text;
                     SearchCubit.get(context).search(searchText: text);
                   },
                    type: TextInputType.text,
                    controller: searchController,
                    validate: (text) {
                      if (text!.isEmpty) {
                        return 'Enter a text to search';
                      }
                      return 'error';
                    },
                    label: 'Type anything to search',
                    prefix: Icons.search,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (state is SearchLoadingState)
                    const LinearProgressIndicator(),
                  const SizedBox(
                    height: 10,
                  ),
                  if (state is SearchLoadingState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return buildSearchProduct(
                            context,
                            index,
                            model: cubit.searchModel!.data!.data![index],
                            isOldPrice: false,
                          );
                        },
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount:cubit.searchModel!.data!.data!.length,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Widget buildSearchProduct(context,index ,{bool isOldPrice = true, model}) {
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
                    image: NetworkImage(SearchCubit.get(context).searchModel?.data?.data?[index].image ?? ''),
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
                    SearchCubit.get(context).searchModel?.data?.data?[index].name?? '',
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
                        SearchCubit.get(context).searchModel?.data?.data?[index].price ?? '',
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
