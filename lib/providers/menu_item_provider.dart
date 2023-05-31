import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuIndexProvider =
    StateNotifierProvider<MenuIndexNotifier, int>((ref) => MenuIndexNotifier());

class MenuIndexNotifier extends StateNotifier<int> {
  MenuIndexNotifier() : super(0);

  void updateIndex(int index) {
    state = index;
  }
}

// StateNotifier for Playground (show/hide)
enum Playground { linear, radial }

final playgroundProvider =
    StateNotifierProvider<PlaygroundNotifier, Playground>(
        (ref) => PlaygroundNotifier());

class PlaygroundNotifier extends StateNotifier<Playground> {
  PlaygroundNotifier() : super(Playground.linear);

  // Playground get selectedPlayground => _selectedPlayground;

  void selectPlayground(Playground playground) {
    state = playground;
  }
}

// StateNotifier for CodeView (show/hide)
final codeViewProvider =
    StateNotifierProvider<CodeViewNotifier, bool>((ref) => CodeViewNotifier());

class CodeViewNotifier extends StateNotifier<bool> {
  CodeViewNotifier() : super(false);

  void updateCodeView(bool showCode) {
    state = showCode;
  }
}

// StateNotifier for ThemeMode (light, dark,)
class DarkModeNotifier extends StateNotifier<bool> {
  DarkModeNotifier() : super(false);

  void toggle() {
    state = !state;
  }
}

final darkModeProvider =
    StateNotifierProvider<DarkModeNotifier, bool>((ref) => DarkModeNotifier());
