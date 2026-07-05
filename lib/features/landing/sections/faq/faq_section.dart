import 'package:career_transformation_institute/core/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/section_title.dart';
import 'widgets/faq_item.dart';

/// Frequently Asked Questions — an accordion, one item expanded at a time.
class FaqSection extends StatefulWidget {
  const FaqSection({super.key});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  static const _faqs = [
    (
      question: 'Do I need prior experience to enroll?',
      answer:
          'No. Each Career School starts from the fundamentals — our onboarding assessment personalizes your starting point based on what you already know.',
    ),
    (
      question: 'How long does a program take to complete?',
      answer:
          'Most students complete their chosen school in 4–8 months, including the internship, depending on pace and prior background.',
    ),
    (
      question: 'Is placement guaranteed after I finish?',
      answer:
          'We guarantee placement *support* — mock interviews, employer matching, and pipeline access — until you\'re hired. Outcomes ultimately depend on performance and market conditions, but 88% of graduates are placed within 6 months.',
    ),
    (
      question: 'Can I study while working a full-time job?',
      answer:
          'Yes. Most tracks offer flexible, self-paced modules alongside live mentor sessions, so you can balance coursework with existing commitments.',
    ),
    (
      question: 'How are internships arranged?',
      answer:
          'Internships are matched based on your school, skill level, and goals, then run through our partner network — see the Internship Ecosystem section above for details.',
    ),
    (
      question: 'What if I\'m not satisfied with the program?',
      answer:
          'We offer a satisfaction window early in the program — reach out to our support team and we\'ll walk you through the specific policy for your school.',
    ),
  ];

  int? _expandedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          const SectionTitle(
            eyebrow: 'Questions',
            title: 'Frequently Asked Questions',
            subtitle:
                'Answers to the questions we hear most from students, parents, and partners.',
          ),
          const SizedBox(height: AppSpacing.xl),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Column(
              children: [
                for (int i = 0; i < _faqs.length; i++)
                  FaqItem(
                    question: _faqs[i].question,
                    answer: _faqs[i].answer,
                    isExpanded: _expandedIndex == i,
                    onTap: () {
                      setState(() {
                        _expandedIndex = _expandedIndex == i ? null : i;
                      });
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
