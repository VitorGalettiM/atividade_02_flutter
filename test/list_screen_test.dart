import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/screen/form_screen.dart';
import '../lib/screen/list_screen.dart';


void main() {
  testWidgets('Navegação para FormScreen ao pressionar FloatingActionButton', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ListScreen(),
      ),
    );

    expect(find.byType(FloatingActionButton), findsOneWidget);
    await tester.tap(find.byType(FloatingActionButton));

    await tester.pumpAndSettle();

    expect(find.byType(FormScreen), findsOneWidget);
  });
}
