import 'package:flutter_test/flutter_test.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:my_portfolio/main.dart';

void main() {
  testWidgets('SeniorFlutterPortfolioApp renders successfully',
      (WidgetTester tester) async {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    await tester.pumpWidget(const SeniorFlutterPortfolioApp());
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.byType(SeniorFlutterPortfolioApp), findsOneWidget);
  });
}
