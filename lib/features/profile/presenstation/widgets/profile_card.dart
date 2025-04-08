import 'package:flutter/material.dart';
import '../../../../app/core/config/app_color.dart';
import '../../../../app/core/config/app_string.dart';
import '../../../../app/core/config/assets.dart';
import '../../../../app/core/config/custom_text_style.dart';
import '../../../../app/core/utils/context_extension.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: context.height * 0.45),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Assets.gradientPNG, fit: BoxFit.fill),
          _body(context.mediaQuerySize),
        ],
      ),
    );
  }

  Widget _body(Size deviceSize) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: deviceSize.height * 0.06,
          left: deviceSize.width * 0.05,
          right: deviceSize.width * 0.05,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: deviceSize.height * 0.07,
          children: [_yourProfileText(), _profileCardHeader(deviceSize)],
        ),
      ),
    );
  }

  Widget _yourProfileText() {
    return Text(AppString.yourProfile, style: CustomTextStyle.heading);
  }

  /// hallo part
  Widget _profileCardHeader(Size deviceSize) {
    return Container(
      width: deviceSize.width,
      decoration: BoxDecoration(
        color: AppColor.profileCardBg,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: deviceSize.height * 0.02,
          right: deviceSize.height * 0.02,
          top: deviceSize.height * 0.025,
          bottom: deviceSize.height * 0.025,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              spacing: deviceSize.width * 0.01,
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.scale(
                  scaleX: -1, // Flip horizontally
                  child: Icon(Icons.waving_hand_outlined, size: 25),
                ),
                Text(AppString.hello, style: CustomTextStyle.profileCardHello),
              ],
            ),

            Text(email, style: CustomTextStyle.profileCardEmail),
          ],
        ),
      ),
    );
  }
}
