import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hn_market/main/bloc/main_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'database/object_box.dart';
import 'firebase_options.dart';
import 'app_router/my_observer.dart';
import 'utils/custom_animation.dart';
import 'utils/loading.dart';
import 'utils/utils.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  HttpOverrides.global = MyHttpOverrides();
  Utils.objectBox = await ObjectBox.create();
  configLoading();
  const fatalError = true;
  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  };
  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  };

  runApp(BlocProvider(
    create: (context) => MainBloc()..add(const Started()),
    child: const MyApp(),
  ));
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 500)
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.transparent
    ..boxShadow = []
    ..textColor = '151515'.color
    ..progressColor = Colors.green
    ..indicatorColor = Colors.white
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = Colors.transparent
    ..contentPadding = EdgeInsets.zero
    ..indicatorWidget = const LoadingWidget()
    ..radius = 100
    ..dismissOnTap = false
    ..indicatorSize = 20
    ..userInteractions = false
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Utils.mainBloc = context.read<MainBloc>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        fontSizeResolver: FontSizeResolvers.radius,
        builder: (_, child) {
          return RefreshConfiguration(
            footerTriggerDistance: 30,
            dragSpeedRatio: 0.91,
            enableScrollWhenRefreshCompleted: true,
            headerBuilder: () => const MaterialClassicHeader(),
            footerBuilder: () => ClassicFooter(
              textStyle: Theme.of(context).textTheme.bodyMedium!,
              loadStyle: LoadStyle.ShowWhenLoading,
            ),
            enableLoadingWhenNoData: false,
            shouldFooterFollowWhenNotFull: (state) {
              return false;
            },
            child: MaterialApp.router(
              routerConfig: Utils.appRouter.config(
                navigatorObservers: () => [MyObserver()],
              ),
              builder: EasyLoading.init(),
              debugShowCheckedModeBanner: false,
              locale: const Locale('vi'),
              theme: FlexThemeData.light(
                scheme: FlexScheme.deepPurple,
                surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
                blendLevel: 9,
                subThemesData: const FlexSubThemesData(
                  blendOnLevel: 10,
                  blendOnColors: false,
                  inputDecoratorSchemeColor: SchemeColor.primaryContainer,
                  inputDecoratorIsFilled: false,
                  inputDecoratorRadius: 6.0,
                  inputDecoratorUnfocusedBorderIsColored: false,
                ),
                visualDensity: FlexColorScheme.comfortablePlatformDensity,
                useMaterial3: true,
                swapLegacyOnMaterial3: true,
                // To use the playground font, add GoogleFonts package and uncomment
                fontFamily: GoogleFonts.notoSans().fontFamily,
              ),
              darkTheme: FlexThemeData.dark(
                scheme: FlexScheme.deepPurple,
                surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
                blendLevel: 15,
                subThemesData: const FlexSubThemesData(
                  blendOnLevel: 20,
                  inputDecoratorIsFilled: false,
                  inputDecoratorRadius: 6.0,
                  inputDecoratorUnfocusedBorderIsColored: false,
                ),
                visualDensity: FlexColorScheme.comfortablePlatformDensity,
                useMaterial3: true,
                swapLegacyOnMaterial3: true,
                // To use the Playground font, add GoogleFonts package and uncomment
                fontFamily: GoogleFonts.notoSans().fontFamily,
              ),
              themeMode: ThemeMode.light,
            ),
          );
        });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
