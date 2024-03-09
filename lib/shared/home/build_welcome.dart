import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/controllers/user_controllers/user_controllers.dart';

class BuildWelcome extends ConsumerWidget {
  const BuildWelcome({super.key});

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning,';
    }
    if (hour < 17) {
      return 'Good Afternoon,';
    }
    return 'Good Evening,';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) => ref.watch(userNameStreamProvider).when(
      data: (userName) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(greeting(), style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(height: 6),
              Text(userName, style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.w700)),
            ],
          ),
      loading: Container.new,
      error: (_, __) => Container());
}
