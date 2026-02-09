import 'package:device_preview/device_preview.dart';
import 'package:event/core/providers/appSettingProvider.dart';
import 'package:event/core/routes/app_router.dart';
import 'package:event/core/routes/route_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child:  ChangeNotifierProvider(create:(context) => AppSettingProvider(),child: MyApp(), ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppSettingProvider>(context);

    // Sync locale with language provider
    if (context.locale.languageCode != provider.currentLanguage) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.setLocale(Locale(provider.currentLanguage));
      });
    }

    return DevicePreview(
      builder:(context) =>  MaterialApp(
        useInheritedMediaQuery: true,

        theme: ThemeManger.getLightTheme(),
        darkTheme: ThemeManger.getDarkTheme(),
        themeMode: provider.currentTheme,
        builder: DevicePreview.appBuilder,

        // themeProvider.themeData == ThemeMode.light
        //     ? ThemeManger.getLightTheme()
        //     : ThemeManger.getDarkTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.splash,
        onGenerateRoute: AppRouter.OnGenerateRoute,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
