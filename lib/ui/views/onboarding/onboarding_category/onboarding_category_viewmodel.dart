import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:calpal/app/app.router.dart';
import 'package:file_picker/file_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../services/generative_ai_client_service.dart';
import '../../../../exceptions/calpal_exceptions.dart';
import '../../../../services/utils_service.dart';

class OnboardingCategoryViewModel extends BaseViewModel {
  /// Initializing the required Services and Dependencies
  final _navigationService = locator<NavigationService>();
  final _utilsService = locator<UtilsService>();
  final _generativeAiClientService = locator<GenerativeAiClientService>();
  final _logger = getLogger('OnboardingCategoryViewModel');

  /// LoadingState Status Variable declaration
  bool _loadingStateStatus = false;
  bool get loadingStateStatus => _loadingStateStatus;

  /// Method that returns a boolean for the disabled state if an image has been selected or not
  bool getDisabledState() {
    return selectedMedia.isEmpty;
  }

  /// Method to remove an image that was selected
  void actionRemoveImage() {
    _selectedMedia.clear();
    rebuildUi();
  }

  /// List of selected image
  final List<File?> _selectedMedia = [];
  List<File?> get selectedMedia => _selectedMedia;

  /// Variable to store the selected File image
  File _file = File('');
  File get file => _file;

  /// Variable to store the the selected image Uint8List
  Uint8List _imageUint8List = Uint8List(0);

  /// Method to initiate the setBusy State
  void initiateLoading(bool value) {
    // TODO: implement setBusy
    _loadingStateStatus = value;
    rebuildUi();
  }

  /// Method that implements loading animation state for the view once the viewModel is busy
  @override
  void setBusyForObject(Object? object, bool value) {
    // TODO: implement setBusyForObject
    initiateLoading(value);
    super.setBusyForObject(object, value);
  }

  /// Method to select a food image from the device Photo Library
  Future pickFiles() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result != null) {
      _file = File(result.files.single.path!);

      _imageUint8List = await _file.readAsBytes();

      _selectedMedia.add(_file);

      rebuildUi();
    }
  }

  /// Method to get Food Details
  Future getFoodDetails() async {
    try {
      initiateLoading(true);
      String response = await _generativeAiClientService
              .generateFoodDetails(_imageUint8List) ??
          "";
      initiateLoading(false);

      Map mapResponse = jsonDecode(response);

      _logger.i("Response: $mapResponse");

      if (mapResponse.isEmpty) {
        actionRemoveImage();
        _utilsService.errorMsgNotification(
            text:
                "Kindly upload an image of your preferred food that is not too blurry");
      } else {
        actionRouteToDashboard(mapResponse);
      }
    } on CalpalException catch (e) {
      _logger.e(
          'An error occurred while trying to get food details', e.message);
    } catch (e, s) {
      _logger.e(
          'A major error occurred while trying to get food details', e, s);
    }
  }

  /// Method to route to Home View
  void actionRouteToDashboard(Map foodDetailsResponse) {
    _navigationService.navigateToDashboardView(
        file: _file, foodDetailsResponse: foodDetailsResponse);
  }

  /// Method to route Back to previous View
  void actionRouteBack() {
    _navigationService.back();
  }
}