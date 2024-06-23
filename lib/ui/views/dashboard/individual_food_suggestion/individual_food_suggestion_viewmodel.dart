import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';

class IndividualFoodSuggestionViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _logger = getLogger('IndividualFoodSuggestionViewModel');

  void actionRouteBack() {
    _navigationService.back();
  }
}
