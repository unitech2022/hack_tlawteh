import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hack_tlawateh/core/data/data.dart';
import 'package:hack_tlawateh/core/helpers/helper_functions.dart';
import 'package:hack_tlawateh/core/utlis/api_constatns.dart';
import 'package:hack_tlawateh/core/utlis/enums.dart';
import 'package:hack_tlawateh/modules/general/data/models/user_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_tlawateh/modules/general/presentaion/ui/home_screen/home_screen.dart';
import 'package:hack_tlawateh/modules/general/presentaion/ui/sigup_screen/sigup_screen.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import '../../../../../core/utlis/app_model.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  /// login method

  Future userLogin({userName, context}) async {
    emit(state.copyWith(
      loginUserState: RequestState.loading,
    ));
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiConstants.loginPath));
    request.fields.addAll({'DeviceToken': 'ffffffff', 'UserName': userName});

    http.StreamedResponse response = await request.send();
    print(response.statusCode.toString() + " ======> loginUser");

    if (response.statusCode == 200) {
      String jsonDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonDataString);
      UserResponseModel userResponseModel =
          UserResponseModel.fromJson(jsonData);

      token = "Bearer ${userResponseModel.token}";

      currentUser.token = userResponseModel.token;
      currentUser.fullName = userResponseModel.user.fullName;
      currentUser.userName = userResponseModel.user.userName;
      currentUser.id = userResponseModel.user.id;
      currentUser.country = userResponseModel.user.country;
      currentUser.classRoom = userResponseModel.user.classroom;
      currentUser.deviceToken = userResponseModel.user.deviceToken;
      currentUser.role = userResponseModel.user.role;

      await saveToken();
      pushPageTransition(
          context: context,
          page: const HomeScreen(),
          type: PageTransitionType.rightToLeft);

      emit(state.copyWith(
          loginUserState: RequestState.loaded,
          userResponseModel: userResponseModel));
    } else if (response.statusCode == 401) {
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.error(
            backgroundColor: Color.fromARGB(255, 211, 161, 11),
            message: "الرقم غير مسجل عندنا",
            textStyle: TextStyle(
                fontFamily: "font", fontSize: 16, color: Colors.white),
          ));
      pushPageTransition(
          context: context,
          type: PageTransitionType.leftToRight,
          page: SignUpScreen(phone: userName));
      emit(state.copyWith(
        loginUserState: RequestState.loaded,
      ));
    } else {
      emit(state.copyWith(
        loginUserState: RequestState.error,
      ));
    }
  }

  /// register method

  Future register({context, phone, name, gander, country}) async {
    emit(state.copyWith(registerUserState: RequestState.loading));
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiConstants.registerPath));
    request.fields.addAll({
      'userName': phone,
      'FullName': name,
      'gender': gander,
      'Password': 'Abc123',
      'Role': 'user',
      'Country': country
    });

    http.StreamedResponse response = await request.send();

    print(response.statusCode.toString() + " ======> register");
    if (response.statusCode == 200) {
      String jsonDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonDataString);
      ResponseRegister responseRegister = ResponseRegister.fromJson(jsonData);

      if (responseRegister.status) {
      await  userLogin(context: context, userName: phone);

       emit(state.copyWith(registerUserState: RequestState.loaded));
      }

      
    } else if (response.statusCode == 400) {
      String jsonDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonDataString);
      ResponseRegister responseRegister = ResponseRegister.fromJson(jsonData);
      showTopMessage(
          context: context,
          customBar: CustomSnackBar.error(
              backgroundColor:Colors.red,
              message: responseRegister.message,
              textStyle: const TextStyle(
                  fontFamily: "font", fontSize: 16, color: Colors.white)));
      emit(state.copyWith(registerUserState: RequestState.loaded));
    } else {
      emit(state.copyWith(registerUserState: RequestState.error));
    }
  }

  /// change value of dropdown
  changeCurrentDropValue(AddressModel newValue, int type) {
    if (type == 1) {
      emit(state.copyWith(currentGender: newValue));
    } else {
      emit(state.copyWith(currentCountry: newValue));
    }
  }
}
