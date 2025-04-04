import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../app/core/config/app_color.dart';
import '../../app/core/config/assets.dart';
import '../../app/core/utils/context_extension.dart';

class LoadingScreen extends HookWidget {
  const LoadingScreen({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(true);
    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () {
        if (context.mounted) {
          isLoading.value = false;
        }
      });
      return null;
    }, const []);
    return isLoading.value
        ? Scaffold(
          body: Scaffold(
            backgroundColor: AppColor.brandColor,
            body: _body(context.mediaQuerySize),
          ),
        )
        : child;
  }

  Widget _body(Size deviceSize) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.logo, fit: BoxFit.fitWidth),
        Padding(
          padding: EdgeInsets.only(top: deviceSize.height * 0.05),
          child: const CircularProgressIndicator(color: Colors.white),
        ),
      ],
    );
  }
}
