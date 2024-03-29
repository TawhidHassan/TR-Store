import 'dart:io';
import 'package:TrStore/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:path_provider/path_provider.dart';
import 'Getx Injection/getx_dependenci_injection.dart' as di;
import 'package:http/http.dart' as Http;
import 'Dependenci Injection/injection.dart';
import 'config/theme/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global =  MyHttpOverrides();


  HttpOverrides.global =  MyHttpOverrides();
  var databasePath = await getApplicationSupportDirectory();


  ///dependenci injection
  await injection();
  ///Getx dependenci injection
  Map<String, Map<String, String>> _languages = await di.init();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'),Locale('bn', 'BD'),Locale('es', 'ES'),Locale('hi', 'IN'),Locale('ar', 'SA'), ],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      child: GetMaterialApp.router(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        title: 'Tr Store',
        theme: CustomTheme.lightTheme,
        darkTheme:CustomTheme.darkTheme, // standard dark theme
        themeMode: ThemeMode.system,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
      ),
    );
  }
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context) {

    return super.createHttpClient(context) ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
