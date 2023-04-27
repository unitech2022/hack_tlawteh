import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_tlawateh/modules/general/presentaion/controllers/auth_cubit/auth_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import '../../../../../core/data/data.dart';
import '../../../../../core/helpers/helper_functions.dart';
import '../../../../../core/helpers/sizing.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/utlis/enums.dart';
import '../../../../../core/utlis/strings.dart';
import '../../../../../core/widgets/button_text.dart';
import '../../../../../core/widgets/custom_drop_down_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/text_field.dart';
import '../../../../../core/widgets/texts.dart';

class SignUpScreen extends StatelessWidget {
  final _controller = TextEditingController();
  final String phone;


  SignUpScreen({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: defaultPadding,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    sizedHeight(25),
                    const Texts(
                      title: Strings.register,
                      textColor: Colors.black,
                      fontSize: 35,
                      weight: FontWeight.bold,
                    ),
                    sizedHeight(20),
                    Texts(
                      title: Strings.deseRegister,
                      textColor: Colors.black.withOpacity(.5),
                      fontSize: 15,
                      weight: FontWeight.normal,
                    ),
                    sizedHeight(30),
                    Row(
                      children: [
                        Texts(
                          title: Strings.name,
                          textColor: Colors.black,
                          fontSize: padding15,
                          weight: FontWeight.normal,
                        ),
                      ],
                    ),
                    sizedHeight(10),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 247, 247),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey, width: .5),
                      ),
                      child: TextFieldWidget(
                        hint: "الاسم كاملا",
                        type: TextInputType.text,
                        controller: _controller,
                      ),
                    ),
                    sizedHeight(30),
                    Row(
                      children: [
                        Texts(
                          title: Strings.gender,
                          textColor: Colors.black,
                          fontSize: padding15,
                          weight: FontWeight.normal,
                        ),
                      ],
                    ),
                    sizedHeight(10),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 247, 247),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey, width: .5),
                      ),
                      child: CustomDropDownWidget(
                          currentValue: state.currentGender,
                          selectCar: false,
                          textColor: const Color(0xff28436C),
                          isTwoIcons: false,
                          iconColor: const Color(0xff515151),
                          list: genders,
                          onChanged: (value) {
                            AuthCubit.get(context)
                                .changeCurrentDropValue(value, 1);
                          },
                          hint: "ذكر / أنثى"),
                    ),
                  
                    sizedHeight(30),
                    // select country
                    Row(
                      children: [
                        Texts(
                          title: Strings.country,
                          textColor: Colors.black,
                          fontSize: padding15,
                          weight: FontWeight.normal,
                        ),
                      ],
                    ),
                    sizedHeight(10),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 247, 247),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey, width: .5),
                      ),
                      child: CustomDropDownWidget(
                          currentValue: state.currentCountry,
                          selectCar: false,
                          textColor: const Color(0xff28436C),
                          isTwoIcons: false,
                          iconColor: const Color(0xff515151),
                          list: countries,
                          onChanged: (value) {
                            AuthCubit.get(context)
                                .changeCurrentDropValue(value, 2);
                          },
                          hint: "الدولة"),
                    ),
                    sizedHeight(85),
                    state.registerUserState == RequestState.loading   
                        ? const LoadingWidget(height: 50, color: mainColor)
                        : CustomTextButton(
                            title: "انشاء",
                            width: double.infinity,
                            onPress: () {
                              if (validateValue(context, state)) {
                                AuthCubit.get(context).register(
                                    context: context,
                                    phone: phone,
                                    name: _controller.text,
                                    gander: state.currentGender!.name,
                                    country: state.currentCountry!.name);
                              } else {}
                            },
                            height: 50,
                            textColor: Colors.white,
                            backgroundColor: mainColor),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  bool validateValue(BuildContext context, AuthState state) {
    if (_controller.text.isEmpty) {
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.error(
            backgroundColor: Colors.red,
            message: "من فضلك اكتب الاسم كاملا",
            textStyle: TextStyle(
                fontFamily: "font", fontSize: 16, color: Colors.white),
          ));
      return false;
    } else if (state.currentGender == null) {
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.error(
            backgroundColor: Colors.red,
            message: "من قضلك اختار النوع",
            textStyle: TextStyle(
                fontFamily: "font", fontSize: 16, color: Colors.white),
          ));
      return false;
    } else if (state.currentCountry == null) {
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.error(
            backgroundColor: Colors.red,
            message: "من فضلك اختار الدولة",
            textStyle: TextStyle(
                fontFamily: "font", fontSize: 16, color: Colors.white),
          ));
      return false;
    } else {
      return true;
    }
  }
}
