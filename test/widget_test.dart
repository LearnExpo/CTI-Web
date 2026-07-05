import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:career_transformation_institute/main.dart';

void main() {
  testWidgets('Landing page renders hero headline', (tester) async {
    // Use a large desktop-ish surface so the hero's side-by-side layout
    // and every placeholder section can lay out without overflow.
    tester.view.physicalSize = const Size(1440, 5000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const CareerTransformationApp());
    await tester.pumpAndSettle();

    expect(find.textContaining('Transform Your Career'), findsOneWidget);
    expect(find.textContaining('Start Your Journey'), findsOneWidget);
  });
}
