import 'package:app/constants/app_colors.dart';
import 'package:app/view/user_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class UserScreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: const Text(
          "User List",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => userController.filterUsers(value),
              style: const TextStyle(color: AppColors.textColor),
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: AppColors.textColor),
                hintText: "Search by name",
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (userController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (userController.errorMessage.isNotEmpty) {
                return Center(
                  child: Text(
                    userController.errorMessage.value,
                    style: const TextStyle(
                        color: AppColors.cardColor, fontSize: 18),
                  ),
                );
              }

              if (userController.filteredUsers.isEmpty) {
                return const Center(
                    child: Text("No users found",
                        style: TextStyle(
                            color: AppColors.textColor, fontSize: 24)));
              }

              return RefreshIndicator(
                onRefresh: () async {
                  userController.refreshUsers();
                },
                child: ListView.builder(
                  itemCount: userController.filteredUsers.length,
                  itemBuilder: (context, index) {
                    var user = userController.filteredUsers[index];

                    print(user.companyName);
                    return Card(
                      color: const Color.fromARGB(255, 101, 106, 120),
                      elevation: 8.0,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: ListTile(
                        leading: CircleAvatar(
                            child: Text(
                          user.id.toString(),
                        )),
                        title: Text(
                          user.name,
                          style: const TextStyle(color: AppColors.textColor),
                        ),
                        subtitle: Text(user.email,
                            style: const TextStyle(color: AppColors.textColor)),
                        onTap: () {
                          Get.to(() => UserDetailScreen(user: user));
                        },
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
