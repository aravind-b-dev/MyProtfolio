import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/futuristic_background.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../data/repositories/portfolio_repository.dart';
import '../../about/views/about_section.dart';
import '../../about/views/engineering_pillars_section.dart';
import '../../contact/views/contact_section.dart';
import '../../footer/views/footer_section.dart';
import '../../navigation/nav_controller.dart';
import '../../navigation/widgets/glass_navbar.dart';
import '../../navigation/widgets/mobile_drawer.dart';
import '../../skills/views/skills_section.dart';
import '../../works/views/works_section.dart';
import 'home_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final NavController _navController = NavController();
  final PortfolioRepository _repository = PortfolioRepository();
  final ScrollController _scrollController = ScrollController();

  bool _isMobileDrawerOpen = false;
  bool _showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 300 && !_showScrollToTop) {
        setState(() => _showScrollToTop = true);
      } else if (_scrollController.offset <= 300 && _showScrollToTop) {
        setState(() => _showScrollToTop = false);
      }
    });
  }

  @override
  void dispose() {
    _navController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: FuturisticBackground(
        child: Stack(
          children: [
            // Scrollable Content Layout
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HomeSection(navController: _navController),
                  AboutSection(
                    navController: _navController,
                    repository: _repository,
                  ),
                  const EngineeringPillarsSection(),
                  WorksSection(
                    navController: _navController,
                    repository: _repository,
                  ),
                  SkillsSection(
                    navController: _navController,
                    repository: _repository,
                  ),
                  ContactSection(navController: _navController),
                  const FooterSection(),
                ],
              ),
            ),

            // Fixed Sticky Glass Navbar
            GlassNavbar(
              navController: _navController,
              onOpenMobileMenu: () {
                setState(() => _isMobileDrawerOpen = true);
              },
            ),

            // Animated Mobile Drawer Overlay
            if (_isMobileDrawerOpen)
              MobileDrawer(
                navController: _navController,
                onClose: () {
                  setState(() => _isMobileDrawerOpen = false);
                },
              ),

            // Floating Scroll To Top Button
            if (_showScrollToTop)
              Positioned(
                bottom: 30,
                right: 30,
                child: GlassContainer(
                  padding: const EdgeInsets.all(12),
                  borderRadius: 30,
                  onTap: _scrollToTop,
                  child: const Icon(
                    Icons.arrow_upward_rounded,
                    color: AppColors.accentCyan,
                    size: 24,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
