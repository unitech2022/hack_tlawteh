
import 'package:get_it/get_it.dart';
import 'package:hack_tlawateh/modules/quran/presentaion/controllers/quran_cubit/quran_cubit.dart';

import '../../modules/general/presentaion/controllers/auth_cubit/auth_cubit.dart';
import '../../modules/general/presentaion/controllers/home_cubit/home_cubit.dart';
import '../../modules/general/presentaion/controllers/sub_category_cubit/sub_category_cubit.dart';


final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// bloc
   sl.registerFactory(() => HomeCubit());
    sl.registerFactory(() => QuranCubit());
    sl.registerFactory(() => AuthCubit());
sl.registerFactory(() => SubCategoryCubit());
    // sl.registerFactory(() => MapCubit());
    // sl.registerFactory(() => PlaceCubit(sl()));

    //    sl.registerFactory(() => SearchCubit(sl()));

  //   /// use Cases
  //   sl.registerLazySingleton(() => CheckUerNameUseCase(sl()));
  //   sl.registerLazySingleton(() => LoginUseCase(sl()));
  //   sl.registerLazySingleton(() => SignUpUseCase(sl()));
  //   sl.registerLazySingleton(() => AppUseCase(sl()));
  //   sl.registerLazySingleton(() => GetCarTypesUseCase(sl()));
  //  sl.registerLazySingleton(() => AddTripUseCase(sl()));
  //  sl.registerLazySingleton(() => HomeTripUseCase(sl()));
  // sl.registerLazySingleton(() => NotificationsCubit());
  //   // sl.registerLazySingleton(() => AddFavoriteUseCase(sl()));
  //   // sl.registerLazySingleton(() => SearchCityUseCase(sl()));

  //   /// repository
  //   sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));
  //   sl.registerLazySingleton<BaseAppRepository>(() => AppRepository(sl()));
  //   sl.registerLazySingleton<BaseTripRepository>(() => TripRepository(sl()));
  //   // ///data source
  //   sl.registerLazySingleton<BaseAuthRemoteDataSource>(
  //       () => AuthRemoteDataSource());
  //   sl.registerLazySingleton<BaseAppRemoteDataSource>(
  //       () => AppRemoteDataSource());
  //  sl.registerLazySingleton<BaseTripRemoteDataSource>(() => TripRemoteDataSource());
  }
}
