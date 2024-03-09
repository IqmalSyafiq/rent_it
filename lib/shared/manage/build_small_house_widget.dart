import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildSmallHouseWidget extends ConsumerStatefulWidget {
  const BuildSmallHouseWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuildSmallHouseWidgetState();
}

class _BuildSmallHouseWidgetState extends ConsumerState<BuildSmallHouseWidget> {
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(8)),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('B-35-23', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            Text('What is Residence, Bangsar South, 58000, Kuala Lumpur', style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      );
}
