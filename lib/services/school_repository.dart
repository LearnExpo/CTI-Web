import '../models/school.dart';

/// Static, in-memory data source for Career Schools. Swap this for a real
/// API/CMS call later — every consumer (teaser grid, detail page) already
/// goes through [SchoolsRepository], so only this file changes.
class SchoolsRepository {
  SchoolsRepository._();

  static const List<School> all = [
    School(
      id: 'software-engineering',
      category: 'Technology',
      name: 'School of Software Engineering',
      shortDescription:
          'Full-stack development, from fundamentals to production-grade systems.',
      longDescription:
          'Go from writing your first function to shipping production-grade full-stack applications. You will build real APIs, real front-ends, and deploy real infrastructure — mentored by working engineers the whole way.',
      duration: '6 months',
      format: 'Full-time or part-time',
      skills: ['JavaScript', 'Flutter', 'APIs', 'Databases'],
      curriculum: [
        'Programming Fundamentals & Git',
        'Front-End Development',
        'Back-End & APIs',
        'Databases & System Design',
        'Capstone: Full-Stack Product'
      ],
      outcomes: [
        '92% job placement within 6 months',
        'Average starting salary uplift of 40%',
        '3 portfolio-ready projects on graduation'
      ],
    ),
    School(
      id: 'cloud-devops',
      category: 'Technology',
      name: 'School of Cloud & DevOps',
      shortDescription:
          'Infrastructure, deployment pipelines, and cloud-native architecture.',
      longDescription:
          'Learn to design, deploy, and operate cloud infrastructure the way modern engineering teams do — containers, CI/CD, and infrastructure as code, all built on real deployment scenarios.',
      duration: '5 months',
      format: 'Full-time or part-time',
      skills: ['AWS', 'Docker', 'CI/CD', 'Terraform'],
      curriculum: [
        'Cloud Fundamentals',
        'Containers & Orchestration',
        'CI/CD Pipelines',
        'Infrastructure as Code',
        'Capstone: Production Deployment'
      ],
      outcomes: [
        '89% job placement within 6 months',
        'Hands-on with 3 major cloud providers',
        'Industry certification prep included'
      ],
    ),
    School(
      id: 'product-design',
      category: 'Design',
      name: 'School of Product Design',
      shortDescription:
          'UX research, interaction design, and portfolio-ready case studies.',
      longDescription:
          'Master the full product design process — research, wireframing, prototyping, and testing — and leave with a portfolio of real case studies built alongside partner companies.',
      duration: '5 months',
      format: 'Full-time or part-time',
      skills: ['Figma', 'UX Research', 'Prototyping'],
      curriculum: [
        'Design Thinking & Research',
        'Wireframing & Prototyping',
        'Visual & Interaction Design',
        'Usability Testing',
        'Capstone: End-to-End Case Study'
      ],
      outcomes: [
        '85% job placement within 6 months',
        '4+ polished case studies on graduation',
        'Direct feedback from partner design teams'
      ],
    ),
    School(
      id: 'data-science',
      category: 'Data & AI',
      name: 'School of Data Science',
      shortDescription:
          'Statistics, machine learning, and real-world data pipelines.',
      longDescription:
          'Build the statistical and engineering foundation to work with real data at scale — from exploratory analysis through to deployed machine learning models.',
      duration: '6 months',
      format: 'Full-time or part-time',
      skills: ['Python', 'SQL', 'Machine Learning'],
      curriculum: [
        'Statistics & Python Foundations',
        'Data Wrangling & SQL',
        'Machine Learning Fundamentals',
        'Model Deployment',
        'Capstone: End-to-End ML Project'
      ],
      outcomes: [
        '87% job placement within 6 months',
        'Real datasets from partner companies',
        'Deployed model in a live capstone'
      ],
    ),
    School(
      id: 'applied-ai',
      category: 'Data & AI',
      name: 'School of Applied AI',
      shortDescription:
          'LLMs, applied ML systems, and production AI product development.',
      longDescription:
          'Go beyond theory and build real AI-powered products — from prompt engineering and retrieval systems to shipping production LLM applications.',
      duration: '5 months',
      format: 'Full-time',
      skills: ['LLMs', 'Python', 'Applied ML'],
      curriculum: [
        'Foundations of Applied AI',
        'Prompt Engineering & RAG',
        'Fine-Tuning & Evaluation',
        'Production AI Systems',
        'Capstone: AI Product Launch'
      ],
      outcomes: [
        '90% job placement within 6 months',
        'Ship a working AI product by graduation',
        'Direct exposure to partner AI teams'
      ],
    ),
    School(
      id: 'digital-marketing',
      category: 'Business',
      name: 'School of Digital Marketing',
      shortDescription:
          'Growth, performance marketing, and brand strategy for the digital era.',
      longDescription:
          'Learn to plan, run, and measure marketing campaigns the way modern growth teams do — from paid acquisition to brand strategy, backed by real campaign data.',
      duration: '4 months',
      format: 'Part-time',
      skills: ['SEO', 'Paid Media', 'Analytics'],
      curriculum: [
        'Marketing Fundamentals & Strategy',
        'Performance & Paid Media',
        'Content & Brand Strategy',
        'Analytics & Reporting',
        'Capstone: Live Campaign'
      ],
      outcomes: [
        '82% job placement within 6 months',
        'Manage a live ad budget during the program',
        'Portfolio of real campaign results'
      ],
    ),
    School(
      id: 'product-management',
      category: 'Business',
      name: 'School of Product Management',
      shortDescription:
          'Roadmapping, stakeholder alignment, and shipping products that matter.',
      longDescription:
          'Learn the full craft of product management — discovery, roadmapping, cross-functional leadership, and shipping — through real product briefs from partner companies, mentored by working PMs.',
      duration: '4 months',
      format: 'Full-time or part-time',
      skills: ['Roadmapping', 'Stakeholder Management', 'Product Analytics'],
      curriculum: [
        'Product Discovery & Strategy',
        'Roadmapping & Prioritization',
        'Cross-Functional Leadership',
        'Product Analytics & Experimentation',
        'Capstone: Ship a Real Feature Brief'
      ],
      outcomes: [
        '86% job placement within 6 months',
        'A shipped feature brief for a partner company',
        '1:1 mentorship from a working Product Manager'
      ],
    ),
    School(
      isRegistrationStarted: true,
      id: 'business-development',
      category: 'Business',
      name: 'School of Business Development',
      shortDescription:
          'Lead generation, dual-language client negotiation, and pipeline logging.',
      longDescription:
          'Master the core mechanics of sales and professional corporate culture. Built specifically for Tier 2/3 candidates to master the balance between external Hindi client execution and internal English data logging, CRM tracking, and weekly professional reporting.',
      duration: '3 months',
      format: 'Full-time or part-time',
      skills: [
        'Lead Generation',
        'B2B & B2C Pitching',
        'Objection Handling',
        'CRM & Spreadsheet Logging',
        'Dual-Language Communication (Hindi/English)'
      ],
      curriculum: [
        'Corporate Mechanics & Cold Outreach Foundations',
        'Pitch Architecture & Localized Communication',
        'Objection Handling, Resilience & Pricing Conversation',
        'Capstone: Live Merchant Onboarding & Campaign Management'
      ],
      outcomes: [
        '85% job placement in corporate BD and inside sales roles within 6 months',
        'A live target acquisition portfolio demonstrating verified local conversions',
        'Hands-on fluency with corporate communication channels (Slack, Email, CRM tools)'
      ],
    ),
  ];

  static School? byId(String id) {
    for (final school in all) {
      if (school.id == id) return school;
    }
    return null;
  }

  static List<String> get categories => [
        'All',
        ...{for (final s in all) s.category}
      ];
}
