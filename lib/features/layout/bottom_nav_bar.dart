import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/core/config/app_color.dart';
import '../../app/core/config/custom_text_style.dart';
import 'provider/navigation_provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavProvider);
    final navigationService = ref.watch(navigationServiceProvider);

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColor.bgColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.secondaryText,
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: navigationService.navItems,
          currentIndex: selectedIndex,
          onTap: (index) => navigationService.onTapItem(context, index, ref),
          backgroundColor: Colors.transparent,
          selectedItemColor: AppColor.regularText,
          unselectedItemColor: AppColor.secondaryText,
          selectedLabelStyle: CustomTextStyle.bottomNavBarText,
          unselectedLabelStyle: CustomTextStyle.bottomNavBarText,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          iconSize: 22,
          selectedFontSize: 11,
          unselectedFontSize: 11,
        ),
      ),
    );
  }
}
