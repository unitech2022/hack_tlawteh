import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hack_tlawateh/core/helpers/helper_functions.dart';
import 'package:hack_tlawateh/modules/general/presentaion/ui/home_screen/home_screen.dart';
import 'package:hack_tlawateh/modules/general/presentaion/ui/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
 Future.delayed(Duration.zero, () {
      if (isLogin()) {
        pushPage(context, HomeScreen());
      
      } else {
        pushPage(context, LoginScreen());
        FlutterNativeSplash.remove();
      }
    });
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
