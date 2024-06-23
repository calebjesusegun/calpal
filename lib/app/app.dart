import 'package:calpal/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:calpal/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:calpal/ui/views/home/home_view.dart';
import 'package:calpal/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:calpal/services/secure_storage_service.dart';
import 'package:calpal/services/dio_service.dart';
import 'package:calpal/ui/views/onboarding/onboarding_view.dart';
import 'package:calpal/ui/views/onboarding/onboarding_username/onboarding_username_view.dart';
import 'package:calpal/ui/views/onboarding/onboarding_category/onboarding_category_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: OnboardingUsernameView),
    MaterialRoute(page: OnboardingCategoryView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SecureStorageService),
    LazySingleton(classType: DioService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
