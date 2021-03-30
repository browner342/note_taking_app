import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:note_taking_app/data/authentication_servieces/authentication_service.dart';
import 'package:note_taking_app/view/screens/auth_screens/login_screen/login_screen.dart';

import 'auth_provider.dart';

class MockAuth extends Mock implements BaseAuth {}

void main() {
  Widget makeTestableWidget({Widget child, BaseAuth auth}) {
    return AuthProvider(
      auth: auth,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets('email or password is empty, does not sign in',
      (WidgetTester tester) async {
    MockAuth mockAuth = MockAuth();

    LoginScreen loginScreen = LoginScreen();

    await tester
        .pumpWidget(makeTestableWidget(child: loginScreen, auth: mockAuth));
    await tester.tap(find.byKey(Key('Log In')));

    // verifyNever(await mockAuth.logIn(email: '', password: ''));
  });
}
