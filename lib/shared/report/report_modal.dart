import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/controllers/manage_controllers/manage_controllers.dart';
import 'package:rent_it/controllers/report_controllers/report_controllers.dart';
import 'package:rent_it/controllers/user_controllers/user_controllers.dart';
import 'package:rent_it/services/top_level_services/main_services.dart/main_services.dart';
import 'package:rent_it/shared/build_info_widgets.dart';

Future<void> showReportModal(BuildContext context, String reportId) async {
  return await showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: 0.7,
    maxHeight: 0.7,
    bottomSheetBorderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    builder: (context, controller, _) => ReportModal(reportId: reportId),
  );
}

class ReportModal extends ConsumerStatefulWidget {
  final String reportId;
  const ReportModal({required this.reportId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportModalState();
}

class _ReportModalState extends ConsumerState<ReportModal> {
  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        SliverAppBar(title: Text('Report', style: AppTextStyles.bodyLarge), pinned: true, automaticallyImplyLeading: false, actions: [
          IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))
        ]),
        SliverFillRemaining(
          hasScrollBody: false,
          child: buildContent(),
        )
      ]);

  Widget buildContent() => ref.watch(reportStreamProvider(widget.reportId)).when(
        data: (report) => Padding(
          padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            BuildInfoContainer(title: 'Title', value: report?.title ?? ''),
            buildFromUser(report?.reporterId ?? ''),
            BuildInfoContainer(title: 'Issued', value: timeAgo(report?.createdAt ?? 0)),
            BuildInfoContainer(title: 'Status', value: report?.status.toString().split('.').last ?? ''),
            BuildInfoContainer(title: 'Type', value: report?.type.toString().split('.').last ?? ''),
            buildHouseName(report?.houseId ?? ''),
            BuildInfoContainer(title: 'Description', value: report?.description ?? ''),
          ]),
        ),
        loading: Container.new,
        error: (_, __) => Text(_.toString()),
      );

  Widget buildHouseName(String houseId) => ref.watch(houseStreamProvider(houseId)).when(
        data: (house) {
          String houseName = 'Address not found';

          if (house != null) {
            houseName = house.addressLineOne;
          }

          return BuildInfoContainer(title: 'House', value: houseName);
        },
        loading: () => const CupertinoActivityIndicator(),
        error: (_, __) => Text(_.toString()),
      );

  Widget buildFromUser(String reporterId) => ref.watch(userByIdStreamProvider(reporterId)).when(
        data: (user) {
          return BuildInfoContainer(title: 'From', value: user.userName);
        },
        loading: () => const CupertinoActivityIndicator(),
        error: (_, __) => Text(_.toString()),
      );
}


    // @JsonKey(name: 'id') required String id,
    // @JsonKey(name: 'reporter_id') required String reporterId,
    // @JsonKey(name: 'receiver_id') required String receiverId,
    // @JsonKey(name: 'house_id') required String houseId,
    // @Default(ReportStatus.pending) @JsonKey(name: 'status') ReportStatus? status,
    // @Default(ReportType.house) @JsonKey(name: 'type') ReportType? type,
    // @JsonKey(name: 'title') required String title,
    // @JsonKey(name: 'description') required String description,
    // @JsonKey(name: 'created_at') required int createdAt,
    // @JsonKey(name: 'updated_at') int? updatedAt,
    // @JsonKey(name: 'resolved_at') int? resolvedAt,