import 'package:customwidgets/src/basic/dynamic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Verify DynamicText updates with controller', (WidgetTester tester) async {
    // Arrange - Create a TextEditingController and pump MyApp() widget to tester
    final controller = TextEditingController(text: 'Initial Text');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DynamicText(controller: controller),
        ),
      ),
    );

    // Act - Change the text in the controller
    controller.text = 'Updated Text';
    await tester.pump();

    // Assert - Check that DynamicText widget displays the updated text
    expect(find.text('Updated Text'), findsOneWidget);
  });
}
