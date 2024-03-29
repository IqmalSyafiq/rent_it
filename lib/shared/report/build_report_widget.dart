import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/models/report/report.dart';
import 'package:rent_it/services/top_level_services/main_services.dart/main_services.dart';
import 'package:rent_it/shared/report/report_modal.dart';

class BuildReportWidget extends ConsumerStatefulWidget {
  final String reportId;
  final String reportTitle;
  final String reportDescription;
  final int createdAt;
  final ReportType reportType;
  final String houseId;

  const BuildReportWidget({
    required this.reportId,
    required this.reportTitle,
    required this.reportDescription,
    required this.createdAt,
    required this.reportType,
    required this.houseId,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuildReportWidgetState();
}

class _BuildReportWidgetState extends ConsumerState<BuildReportWidget> {
  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () async => {
            showReportModal(context)
          },
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.scrim.withOpacity(0.3)))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(widget.reportTitle, style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(width: 10),
                Text(timeAgo(widget.createdAt), style: AppTextStyles.bodySmall.copyWith(color: Theme.of(context).colorScheme.scrim)),
              ],
            ),
            Row(children: [
              Text(widget.houseId, style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(width: 10),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary.withOpacity(0.5), borderRadius: BorderRadius.circular(20)), child: Text(widget.reportType == ReportType.house ? 'House' : 'Others', style: AppTextStyles.labelSmall.copyWith(color: Theme.of(context).colorScheme.inversePrimary)))
            ]),
            const SizedBox(height: 10),
            Text(widget.reportDescription, style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w300))
          ])));
}
