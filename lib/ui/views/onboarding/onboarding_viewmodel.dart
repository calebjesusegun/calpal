import 'package:calpal/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class OnboardingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void actionRouteToOnboardingUsername() {
    _navigationService.navigateToOnboardingUsernameView();
  }
}
