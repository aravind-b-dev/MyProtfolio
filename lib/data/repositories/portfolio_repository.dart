import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../models/experience_model.dart';
import '../models/education_model.dart';

class PortfolioRepository {
  List<ProjectModel> getProjects() {
    return const [
      ProjectModel(
        id: "sbi_yono",
        title: "SBI YONO Enterprise Banking",
        subtitle: "Production Mobile Banking App (Millions of Users)",
        description:
            "Led critical modules on SBI YONO at Tata Consultancy Services (TCS). Improved application performance and reduced latency through optimized state management (MobX) and API handling.",
        technologies: [
          "Flutter",
          "Dart",
          "MobX",
          "Clean Architecture",
          "DigiLocker API",
          "Security Hardening"
        ],
        architecture: "Modular Clean Architecture + MobX State Management",
        role: "Senior Flutter Developer (TCS)",
        keyContributions: [
          "Forex Card Journey (Lead): Owned end-to-end development, scalable architecture, and performance delivery.",
          "GSA (Group Sampoorna Arogya) Purchase Journey: Developed core purchasing modules and API integrations.",
          "DigiLocker Integration: Enabled secure document retrieval, consent management, and user onboarding."
        ],
        isEnterprise: true,
      ),
      ProjectModel(
        id: "csb_salesfokuz",
        title: "CSB Salesfokuz – Banking Sales CRM",
        subtitle: "Enterprise Banking Sales & CRM App",
        description:
            "Built a comprehensive sales management application for CSB Bank utilizing MVVM and Provider architecture. Features secure data storage with SQL and REST API cross-platform sync.",
        technologies: [
          "Flutter",
          "Provider",
          "MVVM",
          "SQLite",
          "REST APIs",
          "Unit & Widget Testing"
        ],
        architecture: "MVVM with Provider State Management & Repository Layer",
        role: "Flutter Developer (SkyisLimit)",
        keyContributions: [
          "Integrated SQL encryption protocols for sensitive banking customer data.",
          "Automated testing suite with Unit and Widget tests ensuring zero regression.",
          "Customized CRM pipeline automation for field sales executives."
        ],
        isEnterprise: true,
      ),
      ProjectModel(
        id: "yono_ai_chatbot",
        title: "SBI YONO 2.0 AI Assistant",
        subtitle: "TCS AI Hackathon Winner (Season 2)",
        description:
            "Developed an AI-powered banking chatbot using Python and Gemini LLM as part of the SBI YONO 2.0 team for the TCS AI Hackathon (AI Friday Season 2).",
        technologies: [
          "Python",
          "Gemini LLM",
          "RAG Architecture",
          "PII Masking",
          "Flutter Integration"
        ],
        architecture: "Retrieval-Augmented Generation (RAG) + Privacy Engine",
        role: "AI Lead & Flutter Integrator",
        keyContributions: [
          "Implemented RAG pipeline to eliminate hallucinations and achieve high response precision.",
          "Engineered privacy masking layer to secure PII and credential data in real time."
        ],
        isEnterprise: false,
      ),
      ProjectModel(
        id: "factfokuz_tallyfokuz",
        title: "Factfokuz & Tallyfokuz ERP Suite",
        subtitle: "Workflow Automation & Offline-First ERP",
        description:
            "Scalable CRM/ERP mobile applications for business operations, attendance tracking, leave management, expense claims, and order management with pricing engine.",
        technologies: [
          "Flutter",
          "BLoC",
          "SQLite",
          "Location Services",
          "Multi-Language"
        ],
        architecture: "Offline-First SQLite Architecture with BLoC",
        role: "Flutter Developer (SkyisLimit)",
        keyContributions: [
          "Offline-first synchronization engine handling background SQLite queueing.",
          "Real-time location updates and automated pricing engine for field orders."
        ],
        isEnterprise: true,
      ),
      ProjectModel(
        id: "dataguru_nrithya",
        title: "Dataguru & Nrithya EdTech",
        subtitle: "Education & Video Learning Platforms",
        description:
            "Multi-role education applications featuring attendance tracking, real-time push notifications, video stream playback, and dynamic quiz assessment modules.",
        technologies: [
          "Flutter",
          "Firebase Auth",
          "Firestore",
          "Video Player",
          "REST APIs"
        ],
        architecture: "Feature-Driven Clean Architecture",
        role: "Flutter Developer (Pebery)",
        keyContributions: [
          "Integrated Firebase Auth & Firestore for instant real-time data sync.",
          "Built responsive UI/UX supporting both portrait tablet and mobile layouts."
        ],
        isEnterprise: false,
      ),
      ProjectModel(
        id: "vastra_dallaal",
        title: "Vastra & Dallaal Applications",
        subtitle: "Inventory & Social Matching Platforms",
        description:
            "Barcode-based retail inventory tracking system (Vastra) and matrimony platform with real-time chat and profile matching algorithms (Dallaal).",
        technologies: [
          "Flutter",
          "Barcode Scanner",
          "WebSockets",
          "Firebase",
          "REST APIs"
        ],
        architecture: "MVC / Provider Modular System",
        role: "Flutter Developer (Pebery)",
        keyContributions: [
          "High-speed barcode scanning integration for retail stock auditing.",
          "Real-time messaging and matching algorithm for matrimony users."
        ],
        isEnterprise: false,
      ),
    ];
  }

  List<SkillCategory> getSkillCategories() {
    return const [
      SkillCategory(
        categoryName: "Flutter & Mobile Core",
        icon: Icons.flutter_dash,
        skills: [
          SkillItem(name: "Flutter Framework", level: SkillLevel.expert),
          SkillItem(name: "Dart Language", level: SkillLevel.expert),
          SkillItem(name: "Flutter Web & Mobile", level: SkillLevel.expert),
          SkillItem(name: "Responsive UI/UX", level: SkillLevel.expert),
          SkillItem(name: "SwiftUI (iOS)", level: SkillLevel.strong),
        ],
      ),
      SkillCategory(
        categoryName: "State Management",
        icon: Icons.tune,
        skills: [
          SkillItem(name: "MobX", level: SkillLevel.expert),
          SkillItem(name: "BLoC / Cubit", level: SkillLevel.expert),
          SkillItem(name: "Provider", level: SkillLevel.expert),
          SkillItem(name: "GetX", level: SkillLevel.advanced),
        ],
      ),
      SkillCategory(
        categoryName: "Architecture & Design",
        icon: Icons.account_tree_outlined,
        skills: [
          SkillItem(name: "Clean Architecture", level: SkillLevel.expert),
          SkillItem(name: "MVVM / MVC", level: SkillLevel.expert),
          SkillItem(name: "Repository Pattern", level: SkillLevel.expert),
          SkillItem(name: "Offline-First SQLite", level: SkillLevel.expert),
        ],
      ),
      SkillCategory(
        categoryName: "Backend & Integrations",
        icon: Icons.cloud_sync,
        skills: [
          SkillItem(name: "REST APIs", level: SkillLevel.expert),
          SkillItem(name: "Firebase (Auth, Firestore)", level: SkillLevel.expert),
          SkillItem(name: "DigiLocker Integration", level: SkillLevel.expert),
          SkillItem(name: "Python (Gemini LLM & RAG)", level: SkillLevel.advanced),
        ],
      ),
      SkillCategory(
        categoryName: "DevOps & Quality",
        icon: Icons.developer_board,
        skills: [
          SkillItem(name: "Git & Version Control", level: SkillLevel.expert),
          SkillItem(name: "Unit & Widget Testing", level: SkillLevel.expert),
          SkillItem(name: "CI/CD Pipelines", level: SkillLevel.advanced),
          SkillItem(name: "Agile / Scrum Methodologies", level: SkillLevel.expert),
        ],
      ),
    ];
  }

  List<ExperienceModel> getExperiences() {
    return const [
      ExperienceModel(
        year: "05/2025 – Present",
        title: "Senior Flutter Developer",
        company: "Tata Consultancy Services (TCS), Hyderabad",
        description:
            "Working on SBI YONO mobile application — one of India’s largest banking platforms serving millions of users. Improved performance and latency through state management & API optimization.",
        highlights: [
          "Forex Card Journey (Lead): Owned end-to-end development, architecture, and performance delivery.",
          "GSA Purchase Journey: Developed core purchasing modules and API integrations.",
          "DigiLocker Integration: Enabled secure document retrieval, consent management, and seamless onboarding."
        ],
      ),
      ExperienceModel(
        year: "09/2022 – 04/2025",
        title: "Flutter Developer",
        company: "SkyisLimit Technologies Pvt Ltd",
        description:
            "Developed scalable CRM and ERP applications for business operations, workflow automation, and banking sales (CSB Bank).",
        highlights: [
          "Implemented Provider, BLoC, and GetX architectures.",
          "Designed offline-first solutions using SQLite for attendance, orders, and expense tracking.",
          "Followed Agile practices with rigorous unit and widget testing suites."
        ],
      ),
      ExperienceModel(
        year: "03/2021 – 09/2022",
        title: "Flutter Developer",
        company: "Pebery Technologies Pvt. Ltd",
        description:
            "Developed cross-platform matrimony and education applications with Firebase real-time sync.",
        highlights: [
          "Integrated Firebase Auth, Firestore, and REST APIs.",
          "Designed responsive UI/UX and optimized rendering performance."
        ],
      ),
      ExperienceModel(
        year: "10/2020 – 02/2021",
        title: "Flutter Developer Intern",
        company: "Pebery Technologies Pvt. Ltd",
        description:
            "Built foundational expertise in Flutter, Dart, Firebase, and Agile code reviews.",
        highlights: [
          "Participated in daily Agile sprint cycles and peer code reviews."
        ],
      ),
    ];
  }

  List<EducationModel> getEducation() {
    return const [
      EducationModel(
        period: "06/2015 – 05/2018",
        degree: "Bachelor of Science in Electronics (B.Sc.)",
        institution: "Mahatma Gandhi University",
        location: "Kottayam, Kerala",
      ),
      EducationModel(
        period: "04/2013 – 12/2013",
        degree: "Diploma in Computer Application (DCA)",
        institution: "Xeon Computers",
        location: "Kottayam, Kerala",
      ),
      EducationModel(
        period: "04/2013 – 03/2015",
        degree: "H.S.E (Science)",
        institution: "Technical Higher Secondary School",
        location: "Puthuppally, Kottayam",
      ),
    ];
  }
}
