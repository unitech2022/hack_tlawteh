import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_tlawateh/core/utlis/enums.dart';
import 'package:hack_tlawateh/modules/quran/data/models/quran_response.dart';
import 'package:hack_tlawateh/modules/quran/data/models/surah_model.dart';
import 'package:pdfx/pdfx.dart';

import '../../../../../core/helpers/helper_functions.dart';
import '../../../../../core/utlis/app_model.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranState());

  static QuranCubit get(context) => BlocProvider.of<QuranCubit>(context);

  int initPage = 604;
  SurahModel? surahModel;
  int? from;
  int? to;
  int? reapting;
  List<int> counts = [];
  List<int> repeats = [];
  late PdfController pdfController;

  Future getDocument({page}) async {
    surahModel = null;
    from = null;
    to = null;
    emit(state.copyWith(getQuranState: RequestState.loading));

    if (AppModel.page != "") {
      initPage = int.parse(AppModel.page);
    }

    pdfController = PdfController(
        document: PdfDocument.openAsset("assets/quran/quran.pdf"),
        initialPage: initPage,
        viewportFraction: 1.3);
    emit(state.copyWith(
        initPage: initPage,
        pdfController: pdfController,
        getQuranState: RequestState.loaded));

    getSurah();
  }

  getPage(page) {
    pdfController.animateToPage(page,
        duration: Duration(milliseconds: 250), curve: Curves.ease);

    emit(state.copyWith(getQuranState: RequestState.loaded));
  }
  // get Surah

  getSurah() async {
    repeats = List<int>.generate(5, (i) => i + 1);
    var jsonText = await rootBundle.loadString('assets/quran/surah.json');

    var data = json.decode(jsonText);

    emit(state.copyWith(quranResponse: QuranResponse.fromJson(data)));
  }

  Future<bool> hasSupport() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    bool hasSupport = androidInfo.version.sdkInt! >= 21;
    return hasSupport;
  }

  changeCurrentDropValue({newValue, type, numb}) {
    if (type == 0) {
      surahModel = newValue;
      emit(state.copyWith(currentValueSurah: newValue));
    } else if (type == 1) {
      from = numb;
      emit(state.copyWith(changeSelectAya: numb));
    } else if (type == 2) {
      reapting = numb;
      emit(state.copyWith(changeSelectAya: numb));
    } else {
      to = numb;
      emit(state.copyWith(changeSelectAya: numb));
    }
  }
}
