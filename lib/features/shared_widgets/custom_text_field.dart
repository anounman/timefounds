import 'package:flutter/material.dart';

import '../../app/core/config/app_color.dart';
import '../../app/core/config/custom_text_style.dart';

class CustomTextField {
  CustomTextField._();
  static Widget standerdInput({
    required BuildContext context,
    String? text,
    double? borderRadius,
    double? height,
    bool isHidden = false,
    String? label,
    required String hintText,
    Color? color,
    bool isNext = false,
    Color? textInputColor,
    Color? hintTextColor,
    TextStyle? style,
    Widget? suffix,
    TextInputType? textInputType,
    bool? autofocus,
    Function(String)? onChanged,
    Function(String)? onSubmit,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return Container(
      height: height ?? 57,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color ?? AppColor.inputFieldBg,
      ),
      child: Center(
        child: TextFormField(
          style:
              style ?? TextStyle(color: textInputColor ?? AppColor.regularText),
          obscureText: isHidden,
          keyboardType: textInputType ?? TextInputType.text,
          autofocus: autofocus ?? true,
          controller: controller,
          textAlign: TextAlign.left,
          validator: validator,
          
          textAlignVertical: TextAlignVertical.center,
          onChanged: (value) {
            onChanged?.call(value);
          },
          onFieldSubmitted: (value) {
            onSubmit?.call(value);
          },
          textInputAction: isNext ? TextInputAction.next : TextInputAction.done,
          decoration: InputDecoration(
            suffixIcon: suffix,
            isCollapsed: true,
            hintText: hintText,
            contentPadding: EdgeInsets.only(left: 10),
            label:
                label != null
                    ? Text(label, style: CustomTextStyle.regularText)
                    : null,
            hintStyle: CustomTextStyle.inputHinitText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColor.textFieldBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
              borderSide: BorderSide.none,
            ),
            isDense: true,
          ),
        ),
      ),
    );
  }
}
