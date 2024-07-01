import 'package:calpal/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:calpal/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:calpal/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:calpal/services/secure_storage_service.dart';
import 'package:calpal/ui/views/onboarding/onboarding_view.dart';
import 'package:calpal/ui/views/onboarding/onboarding_username/onboarding_username_view.dart';
import 'package:calpal/ui/views/onboarding/onboarding_category/onboarding_category_view.dart';
import 'package:calpal/ui/views/dashboard/dashboard_view.dart';
import 'package:calpal/services/generative_ai_client_service.dart';
import 'package:calpal/services/utils_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    AdaptiveRoute(page: StartupView),
    AdaptiveRoute(page: OnboardingView),
    AdaptiveRoute(page: OnboardingUsernameView),
    AdaptiveRoute(page: OnboardingCategoryView),
    AdaptiveRoute(page: DashboardView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SecureStorageService),
    LazySingleton(classType: GenerativeAiClientService),
    LazySingleton(classType: UtilsService),
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
