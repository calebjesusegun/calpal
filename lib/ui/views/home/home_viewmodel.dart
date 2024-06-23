import 'package:calpal/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final _navigationService = locator<NavigationService>();
  final _logger = getLogger('HomeViewModel');

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void actionRouteToOnboardingCategory() {
    _navigationService.navigateToOnboardingCategoryView();
  }

  setIndexValue(int value) {
    setIndex(value);
  }
}
