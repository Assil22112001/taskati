import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final int maxLines;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final bool raedOnly;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.maxLines = 1,
    this.suffixIcon, this.onTap, this.raedOnly=false, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: raedOnly ,
      maxLines: maxLines,
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        alignLabelWithHint: true,
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
