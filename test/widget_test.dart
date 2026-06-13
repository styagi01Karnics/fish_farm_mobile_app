import 'package:flutter_test/flutter_test.dart';
import 'package:fishing_pond_monitor/main.dart';

void main() {
  testWidgets('App launches login screen', (tester) async {
    await tester.pumpWidget(const FishingPondMonitorApp());
    await tester.pumpAndSettle();

    expect(find.text('Welcome!'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}
