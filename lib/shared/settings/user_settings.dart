import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/services/top_level_services/main_services.dart/main_services.dart';

Future<void> showSettingModal(BuildContext context) async {
  await showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: 0.3,
    maxHeight: 0.3,
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLeading(),
          Expanded(child: Container()),
          _buildLogoutSection(),
          _testButton()
        ],
      ),
    );
  }

  Widget _buildLeading() => SizedBox(
      width: 192,
      child: Text(
        'Settings',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.outlineVariant),
      ));

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
