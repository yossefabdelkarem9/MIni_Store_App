// Basic smoke test for the Mini Store App.
//
// Verifies that the app boots successfully and renders the key UI elements:
// the AppBar title and at least one product card title.


import 'package:flutter_test/flutter_test.dart';

import 'package:mini_store_app/main.dart';

void main() {
  testWidgets('Mini Store renders AppBar and product grid', (WidgetTester tester) async {
    // Build the app and trigger the first frame.
    await tester.pumpWidget(const MiniStoreApp());
    await tester.pump(); // Allow any post-frame callbacks to settle.

    // AppBar title is visible.
    expect(find.text('Mini Store'), findsOneWidget);

    // At least one known product title is rendered in the grid.
    expect(find.text('Smartphone'), findsOneWidget);
    expect(find.text('Headphones'), findsOneWidget);
    expect(find.text('Smart Watch'), findsOneWidget);
    expect(find.text('Laptop'), findsOneWidget);

    // Each card has a "View Details" button.
    expect(find.text('View Details'), findsNWidgets(4));
  });
}
