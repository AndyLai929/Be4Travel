import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:be4travel_mobile/main.dart';

void main() {
  testWidgets('App renders with Be4Travel title', (WidgetTester tester) async {
    await tester.pumpWidget(const Be4TravelApp());

    expect(find.text('Be4Travel'), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
  });

  testWidgets('App shows loading indicator initially', (WidgetTester tester) async {
    await tester.pumpWidget(const Be4TravelApp());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Suggest Perks FAB is present', (WidgetTester tester) async {
    await tester.pumpWidget(const Be4TravelApp());

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.text('Suggest Perks'), findsOneWidget);
    expect(find.byIcon(Icons.flight_takeoff), findsOneWidget);
  });
}
