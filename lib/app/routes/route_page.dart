import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/provider/auth_provider.dart';
import '../../features/dummy_view/company_screen.dart';
import '../../features/dummy_view/goal_scree.dart';
import '../../features/dummy_view/zwk_scree.dart';
import '../../features/layout/bottom_nav_bar.dart';
import '../../features/profile/presenstation/profile_screen.dart';
import '../../features/dummy_view/home_screen.dart';
import '../../features/profile/presenstation/sub_screens/employement_data_scree.dart';
import '../../features/profile/presenstation/sub_screens/help_screen.dart';
import '../../features/profile/presenstation/sub_screens/legal_screen.dart';
import '../../features/profile/presenstation/sub_screens/personal_data_screen.dart';
import '../../features/profile/presenstation/sub_screens/postbox_screen.dart';
import '../../features/profile/presenstation/sub_screens/setting_screen.dart';
import '../../features/shared_widgets/loading_screen.dart';
import 'app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  return GoRouter(
    initialLocation: AppRoutes.initial,
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      final isLoggedIn = authState.isAuthenticated;
      final isAtLogging = state.fullPath == AppRoutes.login;
      log('[route_log]Current route is:${state.fullPath}');
      log('[route_log]isLoggedIn:$isLoggedIn');
      log('[route_log]isAtLogging:$isAtLogging');
      if (!isLoggedIn && !isAtLogging) return AppRoutes.login;
      if (isLoggedIn && isAtLogging) return AppRoutes.home;
      return null;
    },
    routes: [
      GoRoute(
        name: AppRoutes.login,
        path: AppRoutes.login,
        builder: (context, state) => LoadingScreen(child: LoginScreen()),
      ),

      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => BottomNavBar(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            name: AppRoutes.home,
            builder: (context, state) => HomeScreen(),
          ),
          GoRoute(
            path: AppRoutes.goal,
            name: AppRoutes.goal,
            builder: (context, state) => GoalScreen(),
          ),
          GoRoute(
            path: AppRoutes.zwk,
            name: AppRoutes.zwk,
            builder: (context, state) => ZWkScreen(),
          ),
          GoRoute(
            path: AppRoutes.company,
            name: AppRoutes.company,
            builder: (context, state) => CompanyScreen(),
          ),
          GoRoute(
            path: AppRoutes.profile,
            name: AppRoutes.profile,

            // builder:
            //     (context, state) => LoadingScreen(child: const ProfileScreen()),
            builder: (context, state) => const ProfileScreen(),
            routes: [
              GoRoute(
                path: AppRoutes.postBox,
                name: AppRoutes.postBox,
                parentNavigatorKey: _rootNavigatorKey,
                builder:
                    (context, state) =>
                        LoadingScreen(child: const PostboxScreen()),
              ),
              GoRoute(
                path: AppRoutes.personalData,
                name: AppRoutes.personalData,
                parentNavigatorKey: _rootNavigatorKey,

                builder:
                    (context, state) =>
                        LoadingScreen(child: const PersonalDataScreen()),
              ),
              GoRoute(
                path: AppRoutes.employmentData,
                name: AppRoutes.employmentData,
                parentNavigatorKey: _rootNavigatorKey,

                builder:
                    (context, state) =>
                        LoadingScreen(child: const EmployementDataScree()),
              ),

              GoRoute(
                path: AppRoutes.settings,
                name: AppRoutes.settings,
                parentNavigatorKey: _rootNavigatorKey,

                builder:
                    (context, state) => LoadingScreen(child: SettingScreen()),
              ),
              GoRoute(
                path: AppRoutes.legal,
                name: AppRoutes.legal,
                parentNavigatorKey: _rootNavigatorKey,

                builder:
                    (context, state) => LoadingScreen(child: LegalScreen()),
              ),
              GoRoute(
                path: AppRoutes.help,
                name: AppRoutes.help,
                parentNavigatorKey: _rootNavigatorKey,

                builder: (context, state) => LoadingScreen(child: HelpScreen()),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

// create a route instance for the app
