import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/report_controllers/report_controllers.dart';
import 'package:rent_it/models/report/report.dart';
import 'package:rent_it/shared/report/build_report_widget.dart';

class ReportView extends ConsumerStatefulWidget {
  const ReportView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportViewState();
}

class _ReportViewState extends ConsumerState<ReportView> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(userReportsStreamProvider).when(
        data: (reports) => ListView(
              children: [
                for (var report in reports)
                  BuildReportWidget(
                    reportId: report.id,
                    reportTitle: report.title,
                    reportDescription: report.description,
                    createdAt: report.createdAt,
                    reportType: report.type ?? ReportType.others,
                    houseId: report.houseId,
                  )
              ],
            ),
        loading: Container.new,
        error: (_, __) => Text(_.toString()));
  }
}
