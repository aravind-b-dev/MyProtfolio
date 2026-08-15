import 'package:flutter/material.dart';

enum SkillLevel { expert, advanced, strong, workingKnowledge }

extension SkillLevelExtension on SkillLevel {
  String get label {
    switch (this) {
      case SkillLevel.expert:
        return "Expert";
      case SkillLevel.advanced:
        return "Advanced";
      case SkillLevel.strong:
        return "Strong";
      case SkillLevel.workingKnowledge:
        return "Working Knowledge";
    }
  }
}

class SkillCategory {
  final String categoryName;
  final IconData icon;
  final List<SkillItem> skills;

  const SkillCategory({
    required this.categoryName,
    required this.icon,
    required this.skills,
  });
}

class SkillItem {
  final String name;
  final SkillLevel level;
  final String? iconName;

  const SkillItem({
    required this.name,
    required this.level,
    this.iconName,
  });
}
