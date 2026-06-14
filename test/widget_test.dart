import 'package:flutter_test/flutter_test.dart';
import 'package:garpit_mobile/app/garpit_app.dart';

void main() {
  testWidgets('shows phase two component preview', (tester) async {
    await tester.pumpWidget(const GarpitApp());

    expect(find.text('GARPIT'), findsOneWidget);
    expect(find.text('Komponen UI dasar siap'), findsOneWidget);
    expect(find.text('Fase 2'), findsOneWidget);
    expect(find.text('Masuk'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
  });
}
