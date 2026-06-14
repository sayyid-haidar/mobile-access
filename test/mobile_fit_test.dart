import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garpit_mobile/app/app_theme.dart';
import 'package:garpit_mobile/app/garpit_app.dart';
import 'package:garpit_mobile/app/garpit_app_frame.dart';
import 'package:garpit_mobile/models/door_item.dart';
import 'package:garpit_mobile/screens/door_detail_screen.dart';
import 'package:garpit_mobile/screens/doors_screen.dart';

void main() {
  Future<void> pumpMobile(WidgetTester tester, Widget child) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;

    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(child);
    await tester.pumpAndSettle();
  }

  testWidgets('login fits a 390x844 mobile viewport', (tester) async {
    await pumpMobile(tester, const GarpitApp());

    expect(tester.takeException(), isNull);
    expect(find.text('Door access for your workspace'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Masuk'), findsOneWidget);
  });

  testWidgets('doors screen fits a 390x844 mobile viewport', (tester) async {
    await pumpMobile(
      tester,
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: GarpitTheme.light,
        home: const GarpitAppFrame(child: DoorsScreen()),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('Pintu Saya'), findsOneWidget);
    expect(find.text('Doors'), findsOneWidget);
  });

  testWidgets('door detail fits a 390x844 mobile viewport', (tester) async {
    await pumpMobile(
      tester,
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: GarpitTheme.light,
        home: const GarpitAppFrame(
          child: DoorDetailScreen(
            door: DoorItem(
              title: 'Main Entrance',
              subtitle: 'Buka 24 jam sesuai izin',
              status: DoorStatus.locked,
              selected: true,
            ),
          ),
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('Main Entrance'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Open Door'), findsOneWidget);
  });
}
