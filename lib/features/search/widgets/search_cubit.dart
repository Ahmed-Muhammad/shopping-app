import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled2/core/Shared/constant.dart';
import 'package:untitled2/core/web/API/dio_helper.dart';
import 'package:untitled2/model/search/search_model.dart';

import '../../../core/web/end_points.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

//-----------------search-------------------

  SearchModel? searchModel;

  void search({
    required String searchText,
  }) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: productsSearch,
      token: token,
      lang: 'en',
      data: {"text": searchText},
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error) {
      print('search error ===> ${error.toString()}');
      emit(SearchErrorState());
    });
  }
}
