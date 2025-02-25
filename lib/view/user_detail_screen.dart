import 'package:app/models/user_model.dart';
import 'package:app/widgets/user_detrail_item.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.background,
        title: const Text(
          "User Details",
          style: TextStyle(color: AppColors.textColor),
        ),
        iconTheme: const IconThemeData(color: AppColors.textColor, size: 30.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: AppColors.cardColor,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    child: Text(
                      user.id.toString(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                UserDetailItem(label: "Name", value: user.name),
                UserDetailItem(label: "Email", value: user.email),
                UserDetailItem(label: "Phone", value: user.phone),
                UserDetailItem(
                    label: "Company", value: user.companyName),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
