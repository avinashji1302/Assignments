import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class UserDetailItem extends StatelessWidget {
  final String label;
  final String value;

  const UserDetailItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "$label : ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
                fontSize: 18,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: AppColors.textColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
