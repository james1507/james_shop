import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:james_shop/core/router/router.dart';
import 'package:james_shop/core/style/app_theme.dart';
import 'package:james_shop/core/translations/intl/app_localizations.dart';
import 'package:james_shop/core/translations/l10n.dart';
import 'package:james_shop/features/splash/presentation/page/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'James Shop',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L10n.all,
          theme: appTheme,
          darkTheme: darkAppTheme,
          navigatorKey: navigatorKey,
          onGenerateRoute: AppRouter.generateRoute,
          home: const SplashPage(),
        );
      },
    );
  }
}
