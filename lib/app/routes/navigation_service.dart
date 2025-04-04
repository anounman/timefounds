import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../core/config/app_string.dart';
import 'app_routes.dart';
import 'navigation_provider.dart';

class NavItem {
  const NavItem({required this.label, required this.icon, required this.route});
  final String label;
  final IconData icon;
  final String route;
  BottomNavigationBarItem toBottomNavItem() {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}

class NavigationService {
  final List<NavItem> _items = [
    NavItem(
      icon: LucideIcons.home,
      label: AppString.home,
      route: AppRoutes.home,
    ),
    NavItem(
      icon: LucideIcons.flag,
      label: AppString.goal,
      route: AppRoutes.goal,
    ),
    NavItem(
      icon: LucideIcons.pieChart,
      label: AppString.zwk,
      route: AppRoutes.zwk,
    ),
    NavItem(
      icon: LucideIcons.building,
      label: AppString.company,
      route: AppRoutes.company,
    ),
    NavItem(
      icon: LucideIcons.userCircle,
      label: AppString.profile,
      route: AppRoutes.profile,
    ),
  ];

  List<BottomNavigationBarItem> get navItems =>
      _items.map((item) => item.toBottomNavItem()).toList();

  String getRouteForIndex(int index) {
    if (index >= 0 && index < _items.length) {
      return _items[index].route;
    }
    return AppRoutes.home;
  }

  void onTapItem(BuildContext context, int index, WidgetRef ref) {
    ref.read(bottomNavProvider.notifier).state = index;

    final route = getRouteForIndex(index);
    context.go(route);
  }
}

final navigationServiceProvider = Provider<NavigationService>((ref) {
  return NavigationService();
});
