import 'package:career_transformation_institute/services/school_repository.dart';
import 'package:career_transformation_institute/widget/candidate_contact_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/animations/entrance_animations.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_typography.dart';
import '../../core/responsive/responsive.dart';
import '../../core/widgets/buttons.dart';
import '../../core/widgets/misc_widgets.dart';
import '../../core/widgets/responsive_builder.dart';
import '../../models/school.dart';
import '../landing/sections/footer/footer_section.dart';

/// Detail page for a single Career School — reached from the Schools
/// section's card grid, e.g. Business → School of Product Management.
class SchoolDetailPage extends StatelessWidget {
  final String schoolId;

  const SchoolDetailPage({super.key, required this.schoolId});

  @override
  Widget build(BuildContext context) {
    final school = SchoolsRepository.byId(schoolId);
    if (school == null) return _NotFound(schoolId: schoolId);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Breadcrumb(school: school),
            _HeroBanner(school: school),
            _DetailBody(school: school),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}

class _NotFound extends StatelessWidget {
  final String schoolId;
  const _NotFound({required this.schoolId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('We couldn\'t find "$schoolId"',
                        style: AppTypography.headingS),
                    const SizedBox(height: AppSpacing.md),
                    PrimaryButton(
                      label: 'Back to Career Schools',
                      onPressed: () => context.go('/', extra: null),
                    ),
                  ],
                ),
              ),
            ),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}

class _Breadcrumb extends StatelessWidget {
  final School school;
  const _Breadcrumb({required this.school});

  @override
  Widget build(BuildContext context) {
    final hPad = Responsive.horizontalPadding(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: AppSpacing.sm),
      color: AppColors.background,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          _crumb(context, 'Home', () => context.go('/')),
          _sep(),
          Text(school.category,
              style: const TextStyle(color: AppColors.lightText, fontSize: 13)),
          _sep(),
          Text(school.name,
              style: const TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.w600,
                  fontSize: 13)),
        ],
      ),
    );
  }

  Widget _crumb(BuildContext context, String label, VoidCallback onTap) {
    return HoverWidget(
      onTap: onTap,
      child: Text(label,
          style: const TextStyle(color: AppColors.lightText, fontSize: 13)),
    );
  }

  Widget _sep() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Text('/',
            style: TextStyle(color: AppColors.lightText, fontSize: 13)),
      );
}

class _HeroBanner extends StatelessWidget {
  final School school;
  const _HeroBanner({required this.school});

  @override
  Widget build(BuildContext context) {
    final hPad = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(horizontal: hPad, vertical: isMobile ? 40 : 64),
      decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
      child: Center(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: Responsive.maxContentWidth(context)),
          child: SlideInAnimation(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppRadius.xl),
                  ),
                  child: Text(
                    school.category.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        letterSpacing: 1.0),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  school.name,
                  style: AppTypography.scaledHeadingL(
                          isMobile, Responsive.isTablet(context))
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: AppSpacing.sm),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 620),
                  child: Text(
                    school.longDescription,
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 16, height: 1.6),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.sm,
                  children: [
                    _StatPill(
                        icon: Icons.schedule_rounded, label: school.duration),
                    _StatPill(
                        icon: Icons.event_available_rounded,
                        label: school.format),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  final IconData icon;
  final String label;
  const _StatPill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 18),
        const SizedBox(width: 6),
        Text(label,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _DetailBody extends StatelessWidget {
  final School school;
  const _DetailBody({required this.school});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.white,
      child: ResponsiveBuilder(
        mobile: (_) => Column(
          children: [
            if (school.isRegistrationStarted)
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month),
                        const SizedBox(width: AppSpacing.xs),
                        Text('IMPORTANT DATES',
                            style: AppTypography.headingS.copyWith(
                                fontSize: 22,
                                color: Colors.red,
                                letterSpacing: 2)),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    const TagChip(
                      label: 'Start Date: 07-07-2026',
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    TagChip(
                      label: 'End Date  : 08-08-2026',
                      color: Colors.red[200],
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    const _EnrollCta(),
                  ],
                ),
              ),
            const SizedBox(height: AppSpacing.xl),
            _CurriculumList(school: school),
            const SizedBox(height: AppSpacing.xl),
            _OutcomesList(school: school),
            const SizedBox(height: AppSpacing.xl),
            const _EnrollCta(),
          ],
        ),
        desktop: (_) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 6,
                child: Column(
                  children: [
                    if (school.isRegistrationStarted)
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(AppRadius.lg),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calendar_month),
                                    const SizedBox(width: AppSpacing.xs),
                                    Text('IMPORTANT DATES',
                                        style: AppTypography.headingS.copyWith(
                                            fontSize: 22,
                                            color: Colors.red,
                                            letterSpacing: 2)),
                                  ],
                                ),
                                const SizedBox(height: AppSpacing.lg),
                                const TagChip(
                                  label: 'Start Date: 07-07-2026',
                                ),
                                const SizedBox(height: AppSpacing.xs),
                                TagChip(
                                  label: 'End Date  : 08-08-2026',
                                  color: Colors.red[200],
                                ),
                                const SizedBox(height: AppSpacing.xs),
                              ],
                            ),
                            const SizedBox(width: AppSpacing.lg),
                            const Expanded(
                              child: Text(
                                  'Seats are filling fast! Click here to secure your spot before registration closes.'),
                            )
                          ],
                        ),
                      ),
                    const SizedBox(height: AppSpacing.lg),
                    _CurriculumList(school: school),
                  ],
                )),
            const SizedBox(width: AppSpacing.xl),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  _OutcomesList(school: school),
                  const SizedBox(height: AppSpacing.lg),
                  const _EnrollCta(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CurriculumList extends StatelessWidget {
  final School school;
  const _CurriculumList({required this.school});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Curriculum',
            style: AppTypography.headingS.copyWith(fontSize: 22)),
        const SizedBox(height: AppSpacing.sm),
        for (int i = 0; i < school.curriculum.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Text('${i + 1}',
                      style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 13)),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(school.curriculum[i],
                        style: AppTypography.body
                            .copyWith(color: AppColors.text, fontSize: 15)),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [for (final skill in school.skills) TagChip(label: skill)],
        ),
      ],
    );
  }
}

class _OutcomesList extends StatelessWidget {
  final School school;
  const _OutcomesList({required this.school});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Outcomes',
              style: AppTypography.headingS.copyWith(fontSize: 18)),
          const SizedBox(height: AppSpacing.sm),
          for (final outcome in school.outcomes)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle_rounded,
                      color: AppColors.success, size: 18),
                  const SizedBox(width: 6),
                  Expanded(
                      child: Text(outcome,
                          style: AppTypography.body.copyWith(fontSize: 14))),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _EnrollCta extends StatelessWidget {
  const _EnrollCta();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GradientButton(
        label: 'Apply to This School',
        icon: Icons.arrow_forward_rounded,
        onPressed: () async {
          await showDialog<Map<String, String>>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => const ClientContactDialog(),
          );
        }, // wire to a real enrollment form/route later
      ),
    );
  }
}
