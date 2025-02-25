import 'package:app/models/user_model.dart';
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
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Name : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: user.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: AppColors.textColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Email : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: user.email,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: AppColors.textColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text("Phone: ${user.phone}",
                    style: const TextStyle(
                        color: AppColors.textColor, fontSize: 18)),
                const SizedBox(height: 10),
                Text("Company: ${user.companyName ?? 'N/A'}",
                    style: const TextStyle(
                        color: AppColors.textColor, fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
