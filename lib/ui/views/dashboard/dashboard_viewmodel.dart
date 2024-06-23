import 'package:calpal/app/app.router.dart';
import 'package:calpal/services/secure_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';

const String _recommendedSuggestions = 'RecommendedSuggestions';

class DashboardViewModel extends MultipleFutureViewModel {
  final _navigationService = locator<NavigationService>();
  final _secureStorageService = locator<SecureStorageService>();

  final _logger = getLogger('DashboardViewModel');

  String? _username = '';
  String? get username => _username;

  List? _fetchedRecommendedSuggestions = [];
  List? get fetchedRecommendedSuggestions => _fetchedRecommendedSuggestions;

  void updateRecommendedSuggestions(List? recommendedSuggestions) {
    _fetchedRecommendedSuggestions = recommendedSuggestions ?? [];
    rebuildUi();
  }

  retrieveUsername() async {
    _username = await _secureStorageService.readUsername();
    rebuildUi();
  }

  bool get fetchingRecommendedSuggestions => busy(_recommendedSuggestions);

  Future _getRecommendedSuggestions() async {}

  /// Method that executes on entry of the UI view
  Future initialize() async {
    await retrieveUsername();
  }

  void actionRouteToIndividualFoodSuggestionView() {
    _navigationService.navigateToIndividualFoodSuggestionView();
  }

  @override
  // TODO: implement futuresMap
  Map<String, Future Function()> get futuresMap => {
        _recommendedSuggestions: _getRecommendedSuggestions,
      };
}
