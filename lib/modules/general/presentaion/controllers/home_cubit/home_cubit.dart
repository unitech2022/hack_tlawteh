import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hack_tlawateh/core/utlis/app_model.dart';
import 'package:hack_tlawateh/core/utlis/enums.dart';
import 'package:pdfx/pdfx.dart';

import '../../../../../core/helpers/helper_functions.dart';
import '../../../../../core/utlis/api_constatns.dart';
import '../../../data/models/home_response_model.dart';
import '../../../domin/entities/home_response.dart';
import 'package:http/http.dart' as http;
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

// getHome ====================>
  Future getHomeData() async {
    //
    emit(state.copyWith(getHomeState: RequestState.loading));
    var request = http.MultipartRequest(
        'GET',
        Uri.parse(
            "${ApiConstants.getHomePath}UserId=${currentUser.id}&country=${currentUser.country}"));

    http.StreamedResponse response = await request.send();
    print(response.statusCode.toString() + " ======> getHomeApi");

    if (response.statusCode == 200) {
      String jsonDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonDataString);
      FlutterNativeSplash.remove();
      emit(state.copyWith(
          getHomeState: RequestState.loaded,
          homeResponse: HomeResponseModel.fromJson(jsonData)));

    
    } else {
      emit(state.copyWith(getHomeState: RequestState.error));
    }
  }

  /// getQuran

  /// Load PDF Documents
  /// 

  // dynamic data = {};
  // String dataForShare = "";
  // List<PageModel> pages = [];

  // Future loadJsonData() async {
  //   var jsonText = await rootBundle.loadString('assets/quran/quran.json');

  //   data = json.decode(jsonText);

  //   List<Aya> ayats = [];

  //   for (var i = 1; i <= 604; i++) {
  //     ayats = [];
  //     int page = i;
  //     String nameSurah = "";
  //     PageModel pageModel = PageModel();
  //     data["data"]["surahs"].forEach((element1) async {

  //       element1["ayahs"].forEach((element) async {
  //         if (element["page"] == page) {
  //            nameSurah = element1["name"];
  //           // print(element["page"].toString() + " \ " + page.toString());
  //           ayats.add(Aya.fromJson(element));
  //         }
  //       });
  //     });

  //     pageModel.ayates = ayats;
  //     pageModel.nameSurah = nameSurah;
  //     pageModel.number = page;
  //     pages.add(pageModel);
  //   }

  //   print(pages.length.toString());
  //   // emit(state.copyWith(getDataQuran: RequestState.loaded));
  // }
}
