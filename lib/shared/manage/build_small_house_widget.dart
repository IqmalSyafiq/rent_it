import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/shared/manage/house_modal.dart';

class BuildSmallHouseWidget extends ConsumerStatefulWidget {
  final String houseId;
  final String addressLineOne;
  final String addressLineTwo;
  const BuildSmallHouseWidget({
    required this.houseId,
    required this.addressLineOne,
    required this.addressLineTwo,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuildSmallHouseWidgetState();
}

class _BuildSmallHouseWidgetState extends ConsumerState<BuildSmallHouseWidget> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async => {
          showHouseModal(context)
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 6),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.addressLineOne, style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600)),
              Text(widget.addressLineTwo, style: AppTextStyles.bodySmall.copyWith(color: Theme.of(context).colorScheme.surfaceTint)),
            ],
          ),
        ),
      );
}
