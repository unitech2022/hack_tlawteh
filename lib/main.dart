import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hack_tlawateh/core/helpers/helper_functions.dart';

import 'package:hack_tlawateh/modules/general/presentaion/controllers/home_cubit/home_cubit.dart';
import 'package:hack_tlawateh/modules/general/presentaion/ui/sigup_screen/sigup_screen.dart';
import 'package:hack_tlawateh/modules/general/presentaion/ui/splash_screen/splash_screen.dart';
import 'package:hack_tlawateh/modules/quran/presentaion/controllers/quran_cubit/quran_cubit.dart';

import 'core/routers/routers.dart';
import 'core/services/services_locator.dart';
import 'core/thems/them.dart';
import 'modules/general/presentaion/controllers/auth_cubit/auth_cubit.dart';
import 'modules/general/presentaion/controllers/sub_category_cubit/sub_category_cubit.dart';
import 'modules/general/presentaion/ui/login_screen/login_screen.dart';

void main() async {
  ServicesLocator().init();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
//   SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
//   await Future.delayed(const Duration(seconds: 1));
//   SystemChrome.restoreSystemUIOverlays();
// });
  await readToken();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale("ar"), Locale("en")],
        path: "assets/translations",
        // <-- change the path of the translation files
        fallbackLocale: const Locale("ar"),
        startLocale: const Locale("ar"),
        child: Phoenix(child: const MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent));
    return MultiBlocProvider(

      providers: [
          BlocProvider<AuthCubit>(create: (BuildContext context) => sl<AuthCubit>()),
           BlocProvider<HomeCubit>(create: (BuildContext context) => sl<HomeCubit>()),
             BlocProvider<QuranCubit>(create: (BuildContext context) => sl<QuranCubit>()),
             BlocProvider<SubCategoryCubit>(create: (BuildContext context) => sl<SubCategoryCubit>()),
      ],
      child: MaterialApp(
        title: 'Exit Travail',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: theme,
        initialRoute: splash,
        routes: {
          login: (context) => LoginScreen(),
           splash: (context) => SplashScreen(),
          // navigation: (context) => NavigationScreen(),
        },
      ),
    );
  }
}
