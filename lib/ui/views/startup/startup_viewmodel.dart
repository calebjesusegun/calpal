import 'package:stacked/stacked.dart';
import 'package:calpal/app/app.locator.dart';
import 'package:calpal/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../services/secure_storage_service.dart';
import '../../utilities/string_utils.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _secureStorageService = locator<SecureStorageService>();

  /// Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    String username = await _secureStorageService.readUsername() ?? "";

    /// This checks if a username has been stored in local storage and it returns either onboarding view or dashboard view
    if (StringUtil.isEmpty(username)) {
      _navigationService.replaceWithOnboardingView();
      return;
    } else {
      _navigationService.replaceWithOnboardingView();
      // _navigationService.replaceWithDashboardView();
      return;
    }
  }
}
