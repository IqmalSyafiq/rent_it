import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/shared/report/build_report_widget.dart';

class ReportView extends ConsumerStatefulWidget {
  const ReportView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportViewState();
}

class _ReportViewState extends ConsumerState<ReportView> {
  @override
  Widget build(BuildContext context) {
    int numberOfReports = 15;

    List<Widget> reports = List<Widget>.generate(
      numberOfReports,
      (index) => const BuildReportWidget(),
    );

    return ListView(
      children: [
        ...reports,
      ],
    );
  }
}
