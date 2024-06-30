import 'package:calpal/services/utils_service.dart';
import 'package:flutter/material.dart';
import 'package:calpal/app/app.bottomsheets.dart';
import 'package:calpal/app/app.dialogs.dart';
import 'package:calpal/app/app.locator.dart';
import 'package:calpal/app/app.router.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stacked_services/stacked_services.dart';

final _utilsService = locator<UtilsService>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  /// Initiate configurations for overlay support -- showSimpleNotification
  _utilsService.configLoading();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        splitScreenMode: true,
        ensureScreenSize: true,
        builder: (context, child) {
          return OverlaySupport.global(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Calpal',
              theme: ThemeData(
                fontFamily: 'Poppins',
              ),
              initialRoute: Routes.startupView,
              builder: EasyLoading.init(),
              onGenerateRoute: StackedRouter().onGenerateRoute,
              navigatorKey: StackedService.navigatorKey,
              navigatorObservers: [
                StackedService.routeObserver,
              ],
            ),
          );
        });
  }
}
