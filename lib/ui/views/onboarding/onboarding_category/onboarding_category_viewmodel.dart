import 'package:calpal/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';

class OnboardingCategoryViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _logger = getLogger('OnboardingCategoryViewModel');

  int _selectedIndex = -1;
  int get selectedIndex => _selectedIndex;

  bool getDisabledState() {
    return selectedIndex == -1 ? true : false;
  }

  updateSelectedIndex(int index) async {
    _selectedIndex = index;
    _logger.i(_selectedIndex);
    rebuildUi();
  }

  void actionRouteToHome() {
    _navigationService.navigateToHomeView();
  }
}
