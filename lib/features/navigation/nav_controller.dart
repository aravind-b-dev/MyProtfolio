import 'package:flutter/material.dart';

class NavController extends ChangeNotifier {
  final Map<String, GlobalKey> sectionKeys = {
    'HOME': GlobalKey(),
    'ABOUT': GlobalKey(),
    'WORKS': GlobalKey(),
    'SKILLS': GlobalKey(),
    'CONTACT': GlobalKey(),
  };

  String _activeSection = 'HOME';
  String get activeSection => _activeSection;

  void setActiveSection(String section) {
    if (_activeSection != section) {
      _activeSection = section;
      notifyListeners();
    }
  }

  void scrollToSection(String section) {
    setActiveSection(section);
    final key = sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }
}
