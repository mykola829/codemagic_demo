import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:codemagic_demo/main.dart';

void main() {
  testWidgets('лічильник збільшується при тапі на FAB', (tester) async {
    await tester.pumpWidget(const CodemagicDemoApp());

    expect(find.text('Натискань: 0'), findsOneWidget);
    expect(find.text('Натискань: 1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Натискань: 0'), findsNothing);
    expect(find.text('Натискань: 1'), findsOneWidget);
  });

  testWidgets('кнопка "Скинути" обнуляє лічильник', (tester) async {
    await tester.pumpWidget(const CodemagicDemoApp());

    final resetButton = find.widgetWithText(TextButton, 'Скинути');

    // Спочатку лічильник на нулі — кнопка неактивна.
    expect(tester.widget<TextButton>(resetButton).onPressed, isNull);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('Натискань: 2'), findsOneWidget);

    await tester.tap(resetButton);
    await tester.pump();

    expect(find.text('Натискань: 0'), findsOneWidget);
  });
}
