class ProjectModel {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final List<String> technologies;
  final String architecture;
  final String role;
  final List<String> keyContributions;
  final String? githubUrl;
  final String? liveUrl;
  final String? imagePath;
  final bool isEnterprise;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.technologies,
    required this.architecture,
    required this.role,
    required this.keyContributions,
    this.githubUrl,
    this.liveUrl,
    this.imagePath,
    this.isEnterprise = false,
  });
}
