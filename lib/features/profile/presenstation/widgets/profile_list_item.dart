import 'package:flutter/material.dart';

import '../../../../app/core/config/custom_text_style.dart';
import '../../../../app/core/utils/context_extension.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    super.key,
    required this.icon,
    required this.title,
    this.description,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String? description;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          left: context.width * 0.05,
          right: context.width * 0.05,
          top: context.height * 0.01,
          bottom: context.height * 0.01,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: context.width * 0.05,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: context.width * 0.025,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(icon, size: 24)],
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: CustomTextStyle.meunuItemTitle,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                        Visibility(
                          visible: description != null,
                          child: Text(
                            description ?? '',
                            style: CustomTextStyle.regularText,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Transform.flip(
              flipX: true,
              child: const Icon(Icons.arrow_back, size: 24),
            ),
          ],
        ),
      ),
    );
  }
}
