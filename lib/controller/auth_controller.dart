import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isLogin = false.obs;
  var username = ''.obs;

  Future<void> signUp(String user, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Simpan username dan password
    await prefs.setString('username', user);
    await prefs.setString('password', password);

    Get.snackbar('Success', 'Akun berhasil dibuat!');
    Get.toNamed('/login');
  }

  // Method untuk login
  Future<void> login(String user, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? savedUser = prefs.getString('username');
    String? savedPassword = prefs.getString('password');

    if (savedUser == null) {
      Get.snackbar('Error', 'Akun belum terdaftar!');
    }
    else if (user != savedUser) {
      Get.snackbar('Error', 'Username salah!');
    }
    else if (password != savedPassword) {
      Get.snackbar('Error', 'Password salah!');
    }
    else {
      isLogin.value = true;
      username.value = user;

      await prefs.setBool('isLoggedIn', true);

      Get.offAllNamed('/home');
    } 
  }

  // Method untuk memeriksa status login saat aplikasi dibuka kembali
  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? loggedIn = prefs.getBool('isLoggedIn');
    String? savedUser = prefs.getString('username');

    if (loggedIn != null && loggedIn) {
      isLogin.value = true;
      username.value = savedUser ?? '';
      Get.offAllNamed('/home');
    }
  }

  // Fungsi untuk logout
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    isLogin.value = false;
    username.value = '';
    Get.offAllNamed('/login');
  }
}
