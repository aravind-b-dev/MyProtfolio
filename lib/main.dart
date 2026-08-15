import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/home/views/portfolio_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SeniorFlutterPortfolioApp());
}

class SeniorFlutterPortfolioApp extends StatelessWidget {
  const SeniorFlutterPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Senior Flutter Developer | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PortfolioPage(),
    );
  }
}
