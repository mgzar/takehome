part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const LOGIN = _Paths.rLoginScreen;
  static const DASHBOARD = _Paths.rDashboard;

}

abstract class _Paths {
  static const rLoginScreen = "/";
  static const rDashboard = "/dashboard";
}
