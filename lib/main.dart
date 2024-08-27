import 'package:e_commerce/common/utils/app_routes.dart';
import 'package:e_commerce/common/utils/environment.dart';
import 'package:e_commerce/common/utils/kstrings.dart';
import 'package:e_commerce/src/entrypoint/controller/bottom_tab_notifier.dart';
import 'package:e_commerce/src/on_boarding/controller/onbording_notify.dart';
import 'package:e_commerce/src/splash_screen/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);
  await GetStorage.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => OnbordingNotify(),
      ),
      ChangeNotifierProvider(
        create: (context) => TabIndexNotifier(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
        designSize: screenSize,
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: false,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            title: AppText.kAppName,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          );
        },
        child: const SplashScreen());
  }
}
