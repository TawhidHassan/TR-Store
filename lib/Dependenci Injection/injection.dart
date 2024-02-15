
import 'package:get_it/get_it.dart';

import '../network/api_services.dart';

GetIt getIt=GetIt.instance;

Future updateDependency() async{
    getIt.unregister<ApiMethod>();
    getIt.registerSingleton<ApiMethod>(ApiMethod());
}

Future injection()async{
    getIt.allowReassignment=true;
    // getIt.registerLazySingleton<ApiClient>(()=>ApiClient(appBaseUrl: BASE_URL));
    // getIt.registerSingleton<ApiClient>(ApiClientImplementation(),
    //     signalsReady: true);
    // getIt.registerLazySingleton(() => ApiClient(appBaseUrl: BASE_URL));
    // getIt.registerLazySingleton(()=>LocationService());
    // getIt.registerLazySingleton(()=>LocationNameService());

    getIt.registerSingleton<ApiMethod>(ApiMethod());
    // GetIt.I.registerSingleton<ApiClient>(ApiClient(appBaseUrl: BASE_URL));

    // getIt.registerLazySingleton(()=>CustomAleartDialouge());
    // // getIt.registerSingleton(() => ApiClient(appBaseUrl: BASE_URL));

    // getIt.registerSingleton<LocalDataGet>(LocalDataGet());
    // getIt.registerLazySingleton(()=>LocalDataGet());
    // getIt.registerSingleton<SliderRepository>(SliderRepository());
    // getIt.registerLazySingleton(()=>SliderRepository());


   }

//
// getIt.allowReassignment=true;
//
//
// // getIt.registerSingleton<ApiClient>(ApiClientImplementation(),
// //     signalsReady: true);
// getIt.registerSingleton<ApiClient>(ApiClient(appBaseUrl: BASE_URL),signalsReady: true);
// // getIt.registerSingleton(() => ApiClient(appBaseUrl: BASE_URL));
// getIt.registerSingleton<LocationService>(LocationService());
// getIt.registerSingleton<LocalDataGet>(LocalDataGet());
// getIt.registerSingleton<SliderRepository>(SliderRepository());
// getIt.registerSingleton<CategoryRepository>(CategoryRepository());
// getIt.registerSingleton<CourseRepository>( CourseRepository());
// getIt.registerSingleton<TeacherRepository>(TeacherRepository());