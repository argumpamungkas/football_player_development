import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'config/router/routes.dart';
import 'config/router/app_router.dart';
import 'config/app_styles.dart';
import 'config/injection.dart';
import 'providers/preferences_provider.dart';

void main() async {

  // dependency injection
  await Injection().initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // menggunakan library screenutilinit agar tampilan mengikuti ukuran device
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MultiProvider(
        providers: [
          // Create Provider
          // Semua Provider yang diinisiasi pada main/MyApp
          // maka provider tersebut tidak perlu diinisiasi pada page tertentu
          // dan dapat digunakan di seluruh page dengan menggunakan fungsi
          // Consumer pada library provider
          ChangeNotifierProvider(create: (context) => PreferencesProvider()),
        ],
        child: MaterialApp(
          // digunakan untuk direct navigation ke page tertentu dari luar context, misal dari service
          // biasanya digunakan untuk push notification agar dapat langsung ke page tertentu
          // navigatorKey: navigatorKey,
          // name apps
          title: '',
          theme: AppStyles.themeData(),
          // initial route splash page
          initialRoute: Routes.splashPage,
          // routing apps
          routes: AppRouter.routingApp,
        ),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 0.8, // agar text sama di semua device
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
