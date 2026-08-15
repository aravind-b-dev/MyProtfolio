import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/data/models/skill_model.dart';
import 'package:my_portfolio/data/repositories/portfolio_repository.dart';

void main() {
  group('PortfolioRepository Unit Tests', () {
    late PortfolioRepository repository;

    setUp(() {
      repository = PortfolioRepository();
    });

    test('getProjects returns a valid list of production projects', () {
      final projects = repository.getProjects();
      expect(projects, isNotEmpty);
      expect(projects.length, greaterThanOrEqualTo(4));

      final sbiProject = projects.firstWhere((p) => p.id == 'sbi_yono');
      expect(sbiProject.title, contains('SBI YONO'));
      expect(sbiProject.isEnterprise, isTrue);
      expect(sbiProject.technologies, contains('Flutter'));
    });

    test('getSkillCategories returns grouped skill categories with valid levels', () {
      final categories = repository.getSkillCategories();
      expect(categories, isNotEmpty);

      final flutterCategory = categories.firstWhere(
        (c) => c.categoryName.contains('Flutter'),
      );
      expect(flutterCategory.skills, isNotEmpty);

      final flutterItem = flutterCategory.skills.firstWhere(
        (s) => s.name == 'Flutter Framework',
      );
      expect(flutterItem.level, equals(SkillLevel.expert));
    });

    test('getExperiences returns chronological experience timeline', () {
      final experiences = repository.getExperiences();
      expect(experiences, isNotEmpty);
      expect(experiences.first.company, isNotEmpty);
    });
  });
}
