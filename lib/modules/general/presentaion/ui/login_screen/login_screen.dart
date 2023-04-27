import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_tlawateh/core/helpers/helper_functions.dart';
import 'package:hack_tlawateh/core/styles/colors.dart';
import 'package:hack_tlawateh/core/utlis/strings.dart';
import 'package:hack_tlawateh/core/widgets/loading_widget.dart';
import 'package:hack_tlawateh/modules/general/presentaion/controllers/auth_cubit/auth_cubit.dart';
import 'package:hack_tlawateh/modules/general/presentaion/ui/sigup_screen/sigup_screen.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import '../../../../../core/helpers/sizing.dart';
import '../../../../../core/utlis/enums.dart';
import '../../../../../core/widgets/button_text.dart';
import '../../../../../core/widgets/text_field.dart';
import '../../../../../core/widgets/texts.dart';

class LoginScreen extends StatelessWidget {
  final _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: defaultPadding,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  sizedHeight(100),
                  const Texts(
                    title: Strings.welcome,
                    textColor: Colors.black,
                    fontSize: 35,
                    weight: FontWeight.bold,
                  ),
                  sizedHeight(20),
                  Texts(
                    title: Strings.desc,
                    textColor: Colors.black.withOpacity(.5),
                    fontSize: 15,
                    weight: FontWeight.normal,
                  ),
                  sizedHeight(80),
                  Row(
                    children: [
                      Texts(
                        title: Strings.phoneNumber,
                        textColor: Colors.black,
                        fontSize: padding20,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                  sizedHeight(15),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 248, 247, 247),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey, width: .5),
                    ),
                    child: TextFieldWidget(
                      hint: " رقم الهاتف",
                      type: TextInputType.number,
                      controller: _controller,
                    ),
                  ),
                  sizedHeight(120),
                  state.loginUserState == RequestState.loading 
                      ? const LoadingWidget(
                          height: 50, color:mainColor)
                      : CustomTextButton(
                          title: Strings.login,
                          width: double.infinity,
                          onPress: () {
                            if (_controller.text.isNotEmpty) {
                              AuthCubit.get(context).userLogin(
                                  context: context,
                                  userName: _controller.text.trim());
                            } else {
                              showTopMessage(
                                  context: context,
                                  customBar: const CustomSnackBar.error(
                                    backgroundColor:
                                      Colors.red,
                                    message: "أدخل رقم الهاتف",
                                    textStyle: TextStyle(
                                        fontFamily: "font",
                                        fontSize: 16,
                                        color: Colors.white),
                                  ));
                            }
                          },
                          height: 50,
                          textColor: Colors.white,
                          backgroundColor: mainColor),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
