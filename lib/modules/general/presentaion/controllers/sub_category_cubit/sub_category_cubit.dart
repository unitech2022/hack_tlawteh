import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_tlawateh/core/utlis/api_constatns.dart';
import 'package:hack_tlawateh/core/utlis/enums.dart';
import 'package:hack_tlawateh/modules/general/data/models/sub_category_model.dart';
import 'package:hack_tlawateh/modules/general/domin/entities/sub_category.dart';
import 'package:http/http.dart' as http;
part 'sub_category_state.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit() : super(SubCategoryState());
  static SubCategoryCubit get(context) =>
      BlocProvider.of<SubCategoryCubit>(context);

  // get subCategories

  Future getSubCategories({categoryId}) async {
    emit(SubCategoryState(getSubCategoriesState: RequestState.loading));
    var request = http.MultipartRequest(
        'GET', Uri.parse("${ApiConstants.getSubCategories}$categoryId"));

    http.StreamedResponse response = await request.send();

      print(response.statusCode.toString() + " ======> getSubCategories");

    if (response.statusCode == 200) {
      String jsonDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonDataString);
      emit(SubCategoryState(getSubCategoriesState: RequestState.loaded,
      subCategories: 
      List<SubCategoryModel>.from(
              (jsonData as List).map((e) => SubCategoryModel.fromJson(e)))
      ));

    
    } else {
      emit(SubCategoryState(getSubCategoriesState: RequestState.error));
    }
  }

}
