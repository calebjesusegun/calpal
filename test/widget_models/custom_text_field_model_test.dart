import 'package:flutter_test/flutter_test.dart';
import 'package:calpal/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CustomTextFieldModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
