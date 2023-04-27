import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hack_tlawateh/modules/quran/data/models/surah_model.dart';

class MemorizingQuranScreen extends StatelessWidget {
  final SurahModel surahModel;
  final int from, to;
  MemorizingQuranScreen(
      {required this.surahModel, required this.from, required this.to});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(surahModel.titleAr!+"$from ===  $to")),
    );
  }
}
