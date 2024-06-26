import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  testWidgets('Search functionality test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // Find the TextField and enter a city name
    final textFieldFinder = find.byType(TextField);
    await tester.enterText(textFieldFinder, 'New York');
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // Verify that weather data is displayed correctly
    expect(find.text('New York'), findsOneWidget);
    expect(find.textContaining('Temperature'), findsOneWidget);
    // Add more assertions based on your UI structure
  });
}
