import 'package:bagguard/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App loads successfully', (tester) async {
    await tester.pumpWidget(const App());

    expect(find.byType(App), findsOneWidget);
  });
}
