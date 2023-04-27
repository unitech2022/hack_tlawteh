part of 'quran_cubit.dart';

class QuranState extends Equatable {
  final PdfController? pdfController;
    final dynamic currentValueSurah;
  final int initPage;
    final int? changeSelectAya;
  final QuranResponse? quranResponse;
  final RequestState? getQuranState;
  QuranState({this.pdfController, this.getQuranState, this.initPage = 64,this.quranResponse,this.currentValueSurah,this.changeSelectAya});

  QuranState copyWith(
          {final PdfController? pdfController,
          final RequestState? getQuranState,
            final QuranResponse? quranResponse,
               final SurahModel? currentValueSurah,
                 final int? changeSelectAya,
          final int? initPage}) =>
      QuranState(
          pdfController: pdfController ?? this.pdfController,
          getQuranState: getQuranState ?? this.getQuranState,
           quranResponse: quranResponse ?? this.quranResponse,
             currentValueSurah: currentValueSurah ?? this.currentValueSurah,
              changeSelectAya: changeSelectAya ?? this.changeSelectAya,
          initPage: initPage ?? this.initPage);
  @override
  List<Object?> get props => [pdfController, getQuranState, initPage,quranResponse,currentValueSurah,changeSelectAya];
}
