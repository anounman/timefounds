import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../app/core/config/app_color.dart';
import '../../../app/core/config/app_string.dart';
import '../../../app/core/config/custom_text_style.dart';
import '../../../app/core/utils/context_extension.dart';
import '../../../app/routes/app_routes.dart';
import '../../auth/presentation/provider/auth_provider.dart';
import 'widgets/profile_card.dart';
import 'widgets/profile_list_item.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(backgroundColor: AppColor.bgColor, body: _body());
  }

  Widget _body() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final email = ref.watch(authProvider).email!;
        return SingleChildScrollView(
          child: Column(
            children: [
              ProfileCard(email: email),
              Padding(
                padding: EdgeInsets.only(top: context.height * 0.02),
                child: _menuItem(),
              ),
              _profileDefaultItems(),
              _logoutButton(),
            ],
          ),
        );
      },
    );
  }

  Widget _menuItem() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Column(
          children: [
            ProfileListItem(
              icon: LucideIcons.mail,
              title: AppString.postbox,
              description: AppString.postBoxDesc,
              onTap: () => context.pushNamed(AppRoutes.postBox),
            ),
            ProfileListItem(
              icon: LucideIcons.userCircle,
              title: AppString.personalData,
              description: AppString.personalDataDesc,
              onTap: () => context.pushNamed(AppRoutes.personalData),
            ),
            ProfileListItem(
              icon: LucideIcons.building2,
              title: AppString.employmentData,
              description: AppString.employmentDataDesc,
              onTap: () => context.pushNamed(AppRoutes.employmentData),
            ),
          ],
        );
      },
    );
  }

  Widget _profileDefaultItems() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Column(
          children: [
            ProfileListItem(
              icon: LucideIcons.settings,
              title: AppString.setting,
              onTap: () => {context.pushNamed(AppRoutes.settings)},
            ),
            ProfileListItem(
              icon: LucideIcons.library,
              title: AppString.legals,
              onTap: () => context.pushNamed(AppRoutes.legal),
            ),
            ProfileListItem(
              icon: LucideIcons.messageCircle,
              title: AppString.help,
              onTap: () => context.pushNamed(AppRoutes.help),
            ),
          ],
        );
      },
    );
  }

  Widget _logoutButton() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Padding(
          padding: EdgeInsets.only(
            top: context.height * 0.025,
            bottom: context.width * 0.06,
          ),
          child: GestureDetector(
            onTap:
                () => {
                  ref.read(authProvider.notifier).logout(),
                  context.go(AppRoutes.login),
                },
            child: Text(AppString.logout, style: CustomTextStyle.logoutText),
          ),
        );
      },
    );
  }
}
