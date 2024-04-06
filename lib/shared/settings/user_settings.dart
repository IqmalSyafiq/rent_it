import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/services/top_level_services/main_services.dart/main_services.dart';

Future<void> showSettingModal(BuildContext context) async {
  await showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: 0.2,
    maxHeight: 0.2,
    bottomSheetBorderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    builder: (context, controller, _) => const SettingModalItems(),
  );
}

class SettingModalItems extends ConsumerStatefulWidget {
  const SettingModalItems({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingModalItemsState();
}

class _SettingModalItemsState extends ConsumerState<SettingModalItems> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(title: Text('Setting', style: AppTextStyles.bodyLarge), pinned: true, automaticallyImplyLeading: false, actions: [
        IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))
      ]),
      SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
          child: _buildLogoutSection(),
        ),
      )
    ]);
  }

  Widget _buildLogoutSection() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Logout', style: Theme.of(context).textTheme.bodyMedium),
          IconButton(
            onPressed: () async => {
              await logout()
            },
            icon: const Icon(Icons.logout, size: 18, color: Colors.red),
          )
        ],
      );

  // ignore: unused_element
  Widget _testButton() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Test', style: Theme.of(context).textTheme.bodyMedium),
          IconButton(
            onPressed: () async => {},
            icon: const Icon(Icons.logout, size: 18, color: Colors.red),
          )
        ],
      );
}
