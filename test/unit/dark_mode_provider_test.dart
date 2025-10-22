import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/providers/dark_mode_provider.dart';

void main() {
  group('Dark Mode Provider', () {
    late DarkModeProvider darkModeProvider;
    late bool listenerCalled;

    setUp(() {
      darkModeProvider = DarkModeProvider();
      listenerCalled = false;
    });

    test(
      'Given the app starts in light mode, when toggleTheme() is called, then it switches to dark mode',
      () {
        expect(darkModeProvider.isDarkMode, isFalse);

        darkModeProvider.toggleTheme();

        expect(darkModeProvider.isDarkMode, isTrue);
      },
    );

    test(
      'Giver a DarkModeProvider with listeners, when toogleTheme() is called, then notifyListeners() should be triggered',
      () {
        darkModeProvider.addListener(() {
          listenerCalled = true;
        });

        darkModeProvider.toggleTheme();

        expect(listenerCalled, isTrue);
      },
    );
  });
}
