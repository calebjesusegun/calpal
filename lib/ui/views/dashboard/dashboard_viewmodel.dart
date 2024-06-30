import 'package:calpal/app/app.router.dart';
import 'package:calpal/services/secure_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';

class DashboardViewModel extends BaseViewModel {
  /// Initializing the required Services and Dependencies
  final _navigationService = locator<NavigationService>();
  final _secureStorageService = locator<SecureStorageService>();
  final _logger = getLogger('DashboardViewModel');

  /// Variable to store users username
  String? _username = '';
  String? get username => _username;

  /// Method to retrieve users username
  retrieveUsername() async {
    _username = await _secureStorageService.readUsername();
    rebuildUi();
  }

  /// Method that executes on entry of the UI view
  Future initialize() async {
    await retrieveUsername();
  }

  /// Method to route to Onboarding Category View
  void actionRouteToOnboardingCategory() {
    _navigationService.navigateToOnboardingCategoryView();
  }

  /// Method to route to Onboarding Category View
  void actionRouteToOnboardingCategoryView() {
    _navigationService.navigateToOnboardingCategoryView();
  }
}
