import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../models/experience_model.dart';

class PortfolioRepository {
  List<ProjectModel> getProjects() {
    return const [
      ProjectModel(
        id: "sbi_yono",
        title: "SBI YONO Enterprise Banking",
        subtitle: "Production Scale Mobile Application",
        description:
            "Engineered high-concurrency mobile banking modules, complex multi-step transaction journeys, biometric authentication, and enterprise feature-flagged architecture.",
        technologies: [
          "Flutter",
          "Dart",
          "Bloc",
          "Clean Architecture",
          "REST APIs",
          "Biometrics",
          "Security Hardening"
        ],
        architecture: "Modular Clean Architecture (Feature-driven + MVVM)",
        role: "Senior Flutter Engineer / Module Lead",
        keyContributions: [
          "Developed core transactional flows handling high daily active user volumes with 99.9% uptime.",
          "Optimized widget rendering tree and reduced cold start latency by 35%.",
          "Integrated enterprise encryption algorithms, token refreshing, and root detection protocols."
        ],
        isEnterprise: true,
      ),
      ProjectModel(
        id: "forex_journey",
        title: "Global Forex Trading Platform",
        subtitle: "Real-time Currency & Trade Management",
        description:
            "Real-time currency exchange platform featuring WebSocket live order books, dynamic candlestick charting engines, multi-currency wallets, and secure settlement workflows.",
        technologies: [
          "Flutter",
          "WebSockets",
          "Riverpod",
          "CustomPainter",
          "SQLite",
          "JSON RPC"
        ],
        architecture: "Layered Repository Pattern with Reactive State Engine",
        role: "Senior Flutter Architect",
        keyContributions: [
          "Custom canvas chart painter rendering 60 FPS real-time ticker streams.",
          "Implemented offline data caching strategy with SQLite for pending order queues."
        ],
        isEnterprise: true,
      ),
      ProjectModel(
        id: "gsa_purchase",
        title: "GSA Procurement & Purchase Journey",
        subtitle: "Government Enterprise Supply Chain",
        description:
            "Multi-platform procurement portal designed for government supply validation, complex multi-tier approvals, invoice generation, and dynamic reactive forms.",
        technologies: [
          "Flutter Web",
          "Flutter Mobile",
          "Provider",
          "Form Validation",
          "REST APIs"
        ],
        architecture: "Clean Architecture with Unified Responsive Widgets",
        role: "Senior Cross-Platform Engineer",
        keyContributions: [
          "Single codebase powering Desktop Web and Mobile tablet layouts seamlessly.",
          "Automated complex field dependencies and validation logic with micro-second responsiveness."
        ],
        isEnterprise: true,
      ),
      ProjectModel(
        id: "digilocker_integration",
        title: "DigiLocker Verification Engine",
        subtitle: "Government Document & KYC Integration",
        description:
            "High-security document retrieval SDK and verification module enabling seamless identity compliance, OAuth2 authentication, and encrypted PDF parsing.",
        technologies: [
          "Flutter",
          "OAuth 2.0",
          "PKCE",
          "PDF Parser",
          "Encrypted Storage"
        ],
        architecture: "Isolated Module Integration Layer",
        role: "Lead Integration Specialist",
        keyContributions: [
          "Engineered OAuth2 PKCE authorization flow supporting seamless browser custom tabs.",
          "Optimized file payload handling for high-speed KYC document rendering."
        ],
        isEnterprise: true,
      ),
      ProjectModel(
        id: "futuristic_ui_engine",
        title: "Flutter Glassmorphism UI Engine",
        subtitle: "Open Source Design System",
        description:
            "A high-performance custom graphics and glassmorphism UI framework for Flutter Web and Mobile, featuring GPU-accelerated shaders and dynamic particle background system.",
        technologies: [
          "Flutter",
          "Dart",
          "CustomPainter",
          "Shaders",
          "Glassmorphism"
        ],
        architecture: "Component-Driven Utility Architecture",
        role: "Creator & Maintainer",
        keyContributions: [
          "Over 500+ GitHub stars and widespread usage across modern Flutter Web portfolios.",
          "Zero third-party rendering overhead with 60 FPS canvas painting."
        ],
        githubUrl: "https://github.com",
        liveUrl: "https://flutter.dev",
        isEnterprise: false,
      ),
    ];
  }

  List<SkillCategory> getSkillCategories() {
    return const [
      SkillCategory(
        categoryName: "Flutter & Core",
        icon: Icons.flutter_dash,
        skills: [
          SkillItem(name: "Flutter Framework", level: SkillLevel.expert),
          SkillItem(name: "Dart Language", level: SkillLevel.expert),
          SkillItem(name: "Flutter Web Engine", level: SkillLevel.expert),
          SkillItem(name: "Responsive UI Design", level: SkillLevel.expert),
          SkillItem(name: "Animations & Motion", level: SkillLevel.expert),
          SkillItem(name: "CustomPainter & Canvas", level: SkillLevel.advanced),
        ],
      ),
      SkillCategory(
        categoryName: "Architecture & Design",
        icon: Icons.account_tree_outlined,
        skills: [
          SkillItem(name: "Clean Architecture", level: SkillLevel.expert),
          SkillItem(name: "MVVM / Repository Pattern", level: SkillLevel.expert),
          SkillItem(name: "SOLID Principles", level: SkillLevel.expert),
          SkillItem(name: "Dependency Injection", level: SkillLevel.expert),
          SkillItem(name: "Modular Monorepos", level: SkillLevel.advanced),
        ],
      ),
      SkillCategory(
        categoryName: "State Management",
        icon: Icons.tune,
        skills: [
          SkillItem(name: "Bloc / Cubit", level: SkillLevel.expert),
          SkillItem(name: "Provider", level: SkillLevel.expert),
          SkillItem(name: "Riverpod", level: SkillLevel.advanced),
          SkillItem(name: "MobX", level: SkillLevel.strong),
        ],
      ),
      SkillCategory(
        categoryName: "Backend & Integration",
        icon: Icons.cloud_sync,
        skills: [
          SkillItem(name: "REST APIs & JSON RPC", level: SkillLevel.expert),
          SkillItem(name: "WebSockets & Streaming", level: SkillLevel.expert),
          SkillItem(name: "Firebase Services", level: SkillLevel.expert),
          SkillItem(name: "SQLite & Local Caching", level: SkillLevel.expert),
          SkillItem(name: "OAuth2 & Security Hardening", level: SkillLevel.advanced),
        ],
      ),
      SkillCategory(
        categoryName: "DevOps & Engineering",
        icon: Icons.developer_board,
        skills: [
          SkillItem(name: "Git & Branching Strategies", level: SkillLevel.expert),
          SkillItem(name: "CI/CD (GitHub Actions, Fastlane)", level: SkillLevel.advanced),
          SkillItem(name: "Firebase & Vercel Hosting", level: SkillLevel.expert),
          SkillItem(name: "Unit & Widget Testing", level: SkillLevel.expert),
          SkillItem(name: "Performance Profiling & Memory Audit", level: SkillLevel.expert),
        ],
      ),
    ];
  }

  List<ExperienceModel> getExperiences() {
    return const [
      ExperienceModel(
        year: "2024 – Present",
        title: "Senior Flutter Architect / Technical Lead",
        company: "Enterprise Mobility Solutions",
        description:
            "Leading core architecture, state management standards, performance profiling, and cross-platform Flutter Web & Mobile deployments.",
        highlights: [
          "Architected enterprise banking and procurement applications serving millions of users.",
          "Established automated CI/CD pipelines reducing deployment cycles from days to minutes.",
          "Mentored junior/mid-level Flutter engineers on Clean Code and Bloc patterns."
        ],
      ),
      ExperienceModel(
        year: "2022 – 2024",
        title: "Lead Flutter Engineer",
        company: "Fintech & Digital Solutions",
        description:
            "Engineered high-concurrency forex platforms, real-time trading dashboards, and government identity integration SDKs.",
        highlights: [
          "Integrated WebSocket streaming engines for 60 FPS real-time charting.",
          "Delivered end-to-end DigiLocker KYC authorization module."
        ],
      ),
      ExperienceModel(
        year: "2020 – 2022",
        title: "Flutter Developer",
        company: "Mobile Applications Lab",
        description:
            "Developed responsive mobile and web user interfaces, integrated RESTful microservices, and implemented state management solutions.",
        highlights: [
          "Published multiple production apps to Google Play Store and Apple App Store.",
          "Pioneered Flutter Web adoption across client applications."
        ],
      ),
    ];
  }
}
