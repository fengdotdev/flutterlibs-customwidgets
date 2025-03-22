


import 'package:customwidgets/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Verify Loginbox updates with controller', (WidgetTester tester) async {
    final usercontroller = TextEditingController();
    final passcontroller = TextEditingController();
    final errorcontroller = TextEditingController();

    login(BuildContext context) {
      errorcontroller.text = 'Error foo';
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginBox(
            userController: usercontroller,
            passwordController: passcontroller,
            login: login,
            error: errorcontroller,
          ),
        ),
      ),
    );




    usercontroller.text = 'admin123';
    passcontroller.text = 'password123';

    await tester.pump();

    expect(find.text('admin123'), findsOneWidget);
    expect(find.text('password123'), findsOneWidget);
    expect(find.text('Error foo'), findsNothing);

    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('Error foo'), findsOneWidget);
  });
}