import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'navigation_service.dart';

final bottomNavProvider = StateProvider.autoDispose<int>((ref) => 0);
final navigationServiceProvider = Provider((ref) => NavigationService());
