import 'package:calpal/app/app.router.dart';
import 'package:calpal/services/secure_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import 'onboarding_username_view.form.dart';

class OnboardingUsernameViewModel extends FormViewModel
    with $OnboardingUsernameView {
  final _navigationService = locator<NavigationService>();
  final _secureStorageService = locator<SecureStorageService>();
  final _logger = getLogger('OnboardingUsernameViewModel');

  void actionRouteToOnboardingUsername(String username) async {
    await _secureStorageService.writeUsername(username: username);

    _navigationService.navigateToOnboardingCategoryView();
    _logger.i("Username: $username");
  }
}
