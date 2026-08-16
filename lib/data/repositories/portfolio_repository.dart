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
        title: "SBI YONO — Banking Application",
        subtitle: "Senior Flutter Developer (TCS)",
        description:
            "Deliver critical modules for SBI YONO, one of India's largest banking mobile applications. Technical lead for Forex Card journey end-to-end, GSA Purchase modules, and DigiLocker integration.",
        technologies: [
          "Flutter",
          "Dart",
          "MobX",
          "DigiLocker API",
          "Accessibility",
          "REST APIs",
        ],
        architecture: "Modular Clean Architecture + MobX State Management",
        role: "Senior Flutter Developer (TCS)",
        keyContributions: [
          "Owned end-to-end development of Forex Card journey as technical lead, including architecture, implementation, and performance optimization.",
          "Developed key modules and managed API integrations for GSA (Group Sampoorna Arogya) Purchase journey.",
          "Integrated DigiLocker across multiple user journeys enabling secure document access, consent management, and streamlined onboarding.",
          "Implemented accessibility best practices (semantic widgets, screen reader support, focus management) and MobX performance tuning.",
        ],
        isEnterprise: true,
      ),
      ProjectModel(
        id: "csb_salesfokuz",
        title: "CSB Salesfokuz — Banking Sales CRM",
        subtitle: "Banking Sales CRM (CSB Bank)",
        description:
            "Built a sales management application for CSB Bank using Flutter with MVVM and Provider architecture. Features SQL data encryption and REST API cross-platform synchronization.",
        technologies: [
          "Flutter",
          "Provider",
          "MVVM",
          "SQL Encryption",
          "REST APIs",
          "Unit & Widget Testing",
        ],
        architecture: "MVVM with Provider State Management & Repository Layer",
        role: "Flutter Developer (SkyisLimit)",
        keyContributions: [
          "Built sales management application for CSB Bank using Flutter with MVVM and Provider architecture.",
          "Secured data with SQL encryption protocols and integrated REST APIs for cross-platform sync.",
          "Added CRM customization for banking workflows, backed by automated unit and widget testing.",
        ],
        isEnterprise: true,
      ),
      ProjectModel(
        id: "factfokuz_tallyfokuz",
        title: "Factfokuz, Tallyfokuz & Vastra",
        subtitle: "Workflow Automation & Offline-First ERP",
        description:
            "Developed scalable CRM and ERP mobile applications supporting business operations, workflow automation, attendance tracking, expense management, order processing, and inventory.",
        technologies: [
          "Flutter",
          "BLoC",
          "GetX",
          "SQLite",
          "Barcode Scanner",
          "Multi-Language",
        ],
        architecture: "Offline-First SQLite Architecture with BLoC & GetX",
        role: "Flutter Developer (SkyisLimit)",
        keyContributions: [
          "Factfokuz: Employee management app with offline SQLite support, location updates, and multi-language support.",
          "Tallyfokuz: Order management application with integrated pricing engine.",
          "Vastra: Barcode-based inventory management system.",
        ],
        isEnterprise: true,
      ),
      ProjectModel(
        id: "dataguru_nrithya",
        title: "Dataguru, Dallaal & Nrithya",
        subtitle: "Consumer & EdTech Platform Suite",
        description:
            "Built and delivered multiple cross-platform applications across matrimony, education, and learning domains with Firebase real-time data synchronization.",
        technologies: [
          "Flutter",
          "Firebase Auth",
          "Firestore",
          "WebSockets",
          "REST APIs",
        ],
        architecture: "Feature-Driven Clean Architecture",
        role: "Flutter Developer (Pebery)",
        keyContributions: [
          "Dataguru: Multi-role education app with attendance tracking and push notifications.",
          "Dallaal: Matrimony application with real-time chat and profile matching algorithms.",
          "Nrithya: Learning platform with video stream content and quiz assessments.",
        ],
        isEnterprise: false,
      ),
      ProjectModel(
        id: "yono_ai_chatbot",
        title: "AI Assistant",
        subtitle: "TCS AI Hackathon Participant (Season 2)",
        description:
            "Developed an AI-powered banking chatbot using Python and Gemini LLM as part of the SBI YONO 2.0 team for the TCS AI Hackathon (AI Friday Season 2).",
        technologies: [
          "Python",
          "Gemini LLM",
          "RAG Architecture",
          "PII Data Masking",
          "Flutter Integration",
        ],
        architecture: "Retrieval-Augmented Generation (RAG) + Privacy Engine",
        role: "AI Lead & Flutter Integrator",
        keyContributions: [
          "Implemented Retrieval-Augmented Generation (RAG) pipeline to eliminate hallucinations and improve response accuracy.",
          "Engineered real-time data-masking safeguards for sensitive user information (personal and password data).",
        ],
        isEnterprise: false,
      ),
    ];
  }

  List<SkillCategory> getSkillCategories() {
    return const [
      SkillCategory(
        categoryName: "Programming & Mobile Core",
        icon: Icons.flutter_dash,
        skills: [
          SkillItem(name: "Dart", level: SkillLevel.expert),
          SkillItem(name: "Flutter", level: SkillLevel.expert),
          SkillItem(
            name: "Cross-platform Mobile Development",
            level: SkillLevel.expert,
          ),
          SkillItem(name: "Android & iOS", level: SkillLevel.expert),
          SkillItem(name: "Python", level: SkillLevel.advanced),
          SkillItem(name: "SwiftUI", level: SkillLevel.strong),
        ],
      ),
      SkillCategory(
        categoryName: "State Management",
        icon: Icons.tune,
        skills: [
          SkillItem(name: "MobX", level: SkillLevel.expert),
          SkillItem(name: "Provider", level: SkillLevel.expert),
          SkillItem(name: "BLoC", level: SkillLevel.expert),
          SkillItem(name: "GetX", level: SkillLevel.advanced),
          SkillItem(name: "Riverpod", level: SkillLevel.advanced),
        ],
      ),
      SkillCategory(
        categoryName: "Architecture & Design",
        icon: Icons.account_tree_outlined,
        skills: [
          SkillItem(name: "Clean Architecture", level: SkillLevel.expert),
          SkillItem(name: "MVVM & MVC", level: SkillLevel.expert),
          SkillItem(name: "Offline-first Design", level: SkillLevel.expert),
          SkillItem(name: "REST API Integration", level: SkillLevel.expert),
        ],
      ),
      SkillCategory(
        categoryName: "Databases, Cloud & AI",
        icon: Icons.cloud_sync,
        skills: [
          SkillItem(name: "SQLite & SQL", level: SkillLevel.expert),
          SkillItem(
            name: "Firebase Auth & Firestore",
            level: SkillLevel.expert,
          ),
          SkillItem(name: "Supabase", level: SkillLevel.advanced),
          SkillItem(
            name: "Gemini LLM & RAG (Python)",
            level: SkillLevel.advanced,
          ),
        ],
      ),
      SkillCategory(
        categoryName: "Testing, DevOps & Quality",
        icon: Icons.developer_board,
        skills: [
          SkillItem(name: "Unit & Widget Testing", level: SkillLevel.expert),
          SkillItem(name: "Git & Version Control", level: SkillLevel.expert),
          SkillItem(
            name: "Accessibility Implementation",
            level: SkillLevel.expert,
          ),
          SkillItem(
            name: "Agile / Scrum Methodologies",
            level: SkillLevel.expert,
          ),
          SkillItem(name: "SEO & WordPress", level: SkillLevel.advanced),
        ],
      ),
    ];
  }

  List<ExperienceModel> getExperiences() {
    return const [
      ExperienceModel(
        year: "May 2025 – Present",
        title: "Senior Flutter Developer",
        company: "Tata Consultancy Services (TCS), Hyderabad, India",
        description:
            "Deliver critical modules for SBI YONO, one of India's largest banking mobile applications, contributing to a platform used by a large-scale user base.",
        highlights: [
          "Own end-to-end development of the Forex Card journey as technical lead, including architecture design, implementation, and performance optimization.",
          "Develop key modules and manage API integrations for the GSA (Group Sampoorna Arogya) Purchase journey.",
          "Integrate DigiLocker across multiple user journeys, enabling secure document access, consent management, and streamlined onboarding.",
          "Improve application performance and reduce latency through optimized MobX state management and efficient API handling.",
          "Implement accessibility best practices (semantic widgets, screen reader support, focus management, accessible UI components).",
        ],
      ),
      ExperienceModel(
        year: "Sep 2022 – Apr 2025",
        title: "Flutter Developer",
        company: "SkyisLimit Technologies Pvt Ltd",
        description:
            "Developed scalable CRM and ERP mobile applications supporting business operations and workflow automation.",
        highlights: [
          "Implemented Provider, BLoC, and GetX-based architectures to structure feature modules and maintain codebase scalability.",
          "Built core features including attendance tracking, leave management, expense tracking, and order management.",
          "Designed offline-first solutions using SQLite for reliable functionality in low-connectivity environments.",
          "Applied Agile practices with unit and widget testing to maintain code quality and reliability.",
        ],
      ),
      ExperienceModel(
        year: "Mar 2021 – Sep 2022",
        title: "Flutter Developer",
        company: "Pebery Technologies Pvt. Ltd",
        description:
            "Built and delivered multiple cross-platform applications across matrimony and education domains.",
        highlights: [
          "Integrated Firebase Authentication and Firestore for real-time data synchronization.",
          "Designed responsive UI/UX to ensure consistent experience across device sizes.",
          "Implemented REST APIs for backend communication and debugged app performance issues to improve stability.",
        ],
      ),
      ExperienceModel(
        year: "Oct 2020 – Feb 2021",
        title: "Flutter Developer Intern",
        company: "Pebery Technologies Pvt. Ltd",
        description:
            "Built foundational skills in Flutter and Dart through hands-on application development.",
        highlights: [
          "Contributed to Firebase and API integration tasks under senior developer guidance.",
          "Participated in Agile ceremonies and code reviews.",
        ],
      ),
    ];
  }

  List<EducationModel> getEducation() {
    return const [
      EducationModel(
        period: "June 2015 – May 2018",
        degree: "Bachelor of Science in Electronics",
        institution: "Mahatma Gandhi University",
        location: "Kottayam, Kerala",
      ),
      EducationModel(
        period: "April 2013 – December 2013",
        degree: "Diploma in Computer Application",
        institution: "Xeon Computers",
        location: "Kottayam, Kerala",
      ),
      EducationModel(
        period: "April 2013 – March 2015",
        degree: "Higher Secondary Education (Science)",
        institution: "Technical Higher Secondary School",
        location: "Puthuppally, Kottayam",
      ),
    ];
  }
}
