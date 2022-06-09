import 'package:get/get.dart';
import 'package:zarnikyawtest/modules/dashboard/dashboard.dart';
import 'package:zarnikyawtest/modules/dashboard/dashboard_binding.dart';
import 'package:zarnikyawtest/modules/login/login_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.LOGIN;

  static final routes = [
    GetPage(
        name: _Paths.rLoginScreen,
        preventDuplicates: true,
        page: () => const LoginScreen()),
    GetPage(
        name: _Paths.rDashboard,
        page: () => const Dashboard(),
        preventDuplicates: true,
        binding: DashboardBinding()),
  ];
}
