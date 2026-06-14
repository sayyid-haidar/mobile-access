import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garpit_mobile/app/garpit_app.dart';

void main() {
  testWidgets('shows login and validates empty credentials', (tester) async {
    await tester.pumpWidget(const GarpitApp());

    expect(find.text('Door access for your workspace'), findsOneWidget);
    expect(find.text('Masuk'), findsNWidgets(2));
    expect(find.text('Email'), findsOneWidget);

    await tester.ensureVisible(find.widgetWithText(FilledButton, 'Masuk'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Masuk'));
    await tester.pump();

    expect(find.text('Email dan password wajib diisi.'), findsOneWidget);
  });

  testWidgets('navigates with dummy credentials', (tester) async {
    await tester.pumpWidget(const GarpitApp());

    await tester.enterText(find.byType(EditableText).at(0), 'nama@email.com');
    await tester.enterText(find.byType(EditableText).at(1), 'password');
    await tester.ensureVisible(find.widgetWithText(FilledButton, 'Masuk'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Masuk'));
    await tester.pumpAndSettle();

    expect(find.text('Pintu Saya'), findsOneWidget);
    expect(find.text('GARPIT ACCESS PASS'), findsOneWidget);
    expect(find.text('Main Entrance'), findsOneWidget);
    expect(find.text('Doors'), findsOneWidget);

    await tester.ensureVisible(find.text('Main Entrance'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Main Entrance'));
    await tester.pumpAndSettle();

    expect(find.text('Aksi cepat'), findsOneWidget);
    expect(find.text('Open Door'), findsOneWidget);
    expect(find.text('Terkunci'), findsOneWidget);

    await tester.ensureVisible(find.widgetWithText(FilledButton, 'Open Door'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Open Door'));
    await tester.pumpAndSettle();

    expect(find.text('Terbuka'), findsOneWidget);
  });
}
