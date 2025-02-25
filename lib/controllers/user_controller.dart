import 'package:app/services/user_api_service.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  var isLoading = true.obs;

  var users = <UserModel>[].obs;
  var filteredUsers = <UserModel>[].obs;

  var errorMessage = "".obs;
  var searchQuery = "".obs;

  final UserApiService _apiService = UserApiService();

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var fetchedUsers = await _apiService.fetchUsers();
      users.assignAll(fetchedUsers);
      filteredUsers.assignAll(fetchedUsers);
      errorMessage.value = "";
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }

  void refreshUsers() {
    fetchUsers();
  }

  void filterUsers(String searchName) {
    searchQuery.value = searchName;

    if (searchQuery.value.isNotEmpty) {
      filteredUsers.assignAll(users
          .where((user) =>
              user.name.toLowerCase().contains(searchName.toLowerCase()))
          .toList());
    } else {
      filteredUsers.assignAll(users);
    }
  }
}
