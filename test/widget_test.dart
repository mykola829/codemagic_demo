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
}
