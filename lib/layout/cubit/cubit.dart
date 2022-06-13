import 'dart:async';

import 'package:carruncy_converter/layout/HomeScrean.dart';
import 'package:carruncy_converter/layout/cubit/states.dart';
import 'package:carruncy_converter/models/coinModel.dart';
import 'package:carruncy_converter/models/convert_model.dart';
import 'package:carruncy_converter/modules/Converter/Converter.dart';
import 'package:carruncy_converter/modules/Crypto/crypto_Screan.dart';
import 'package:carruncy_converter/modules/calculator/calculator.dart';
import 'package:carruncy_converter/modules/settings/settings.dart';
import 'package:carruncy_converter/shared/end_points.dart';
import 'package:carruncy_converter/shared/network/local/cash_helper.dart';
import 'package:carruncy_converter/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;
  List<Widget> Screans = [
    Crypto_Screan(),
    Converter(),
    calculator(),
    Settings()
  ];
  List<String> Titles = [
    'Crypto',
    'Currensy Converter',
    'calculator',
    'Settings'
  ];

  void changeBottomIndex(index) {
    currentindex = index;
    emit(ChangeBotNavState());
  }

  Converter_Model? converter_model;

  void convert({
    required String from,
    required String to,
    required String amount,
  }) {
    Dio_Helper.getDataforconvert(
      url:
          'convert?from=$from&to=$to&amount=$amount&apikey=7yRNIovfivHMnMDnxE6FjO0xoGQBl4nP',
    ).then((value) {
      converter_model = Converter_Model.fromJson(value.data);
      print(converter_model?.query?.amount);
      emit(AppConvertSuccsesState());
    }).catchError((error) {
      emit(AppConvertErrorState());
    });
  }

  void GetCrypto() {
    emit(AppGetCryptoLodingState());
    Dio_Helper.getDataforCrypto(
      url:
          'v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false',
    ).then((value) {
      coinList = [];
      List<dynamic> values = [];
      values = value.data;
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
      }
      emit(AppGetCryptoSuccsesState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetCryptoErrorState());
    });
  }

  bool isDark = false;

  void ChangeTheme({bool? value}) {
    if (value != null) {
      isDark = value;
      emit(AppChangeTheme());
    } else {
      isDark = !isDark;
      Cash_Helper.PutBoolen(key: 'isDark', value: isDark)
          .then((value) => emit(AppChangeTheme()));
    }
  }
}
