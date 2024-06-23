import 'package:calpal/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import 'onboarding_username_view.form.dart';

class OnboardingUsernameViewModel extends FormViewModel
    with $OnboardingUsernameView {
  final _navigationService = locator<NavigationService>();

  void actionRouteToOnboardingUsername() {
    _navigationService.navigateToOnboardingCategoryView();
  }
}
