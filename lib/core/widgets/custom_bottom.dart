import 'package:flutter/material.dart';
import 'package:taskati/core/theme/app_text_style.dart';

class CustomBottom extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CustomBottom({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.deepPurple,
        ),
        child: Text(
          title,
          style: AppTextStyle.font16A.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
