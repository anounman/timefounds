import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/core/config/app_color.dart';
import 'app/routes/route_page.dart';
import 'features/auth/presentation/provider/auth_repository_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

void main() {
  const bool isDebug = bool.fromEnvironment('dart.vm.product') == false;

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    isDebug
        ? DevicePreview(
        builder: (context) {
            return ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
          ],
          child: MyApp(),
        );
          },
        )
        : const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'TimefoundAG',
      theme: ThemeData(
        primaryColor: AppColor.primaryColor,
        scaffoldBackgroundColor: AppColor.bgColor,
        appBarTheme: AppBarTheme(backgroundColor: AppColor.bgColor),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
