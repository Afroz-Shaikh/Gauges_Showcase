import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuIndexProvider =
    StateNotifierProvider<MenuIndexNotifier, int>((ref) => MenuIndexNotifier());

class MenuIndexNotifier extends StateNotifier<int> {
  MenuIndexNotifier() : super(0);

  void updateIndex(int index) {
    state = index;
  }
}

final codeViewProvider =
    StateNotifierProvider<CodeViewNotifier, bool>((ref) => CodeViewNotifier());

class CodeViewNotifier extends StateNotifier<bool> {
  CodeViewNotifier() : super(false);

  void updateCodeView(bool showCode) {
    state = showCode;
  }
}
