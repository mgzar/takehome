import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zarnikyawtest/helper/firebase_helper.dart';
import 'package:zarnikyawtest/utils/const.dart';
import 'package:zarnikyawtest/utils/theme.dart';

import 'routes/app_pages.dart';
import 'utils/service/app_service.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseHelper().fireBaseConfig,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AppService());
      }),
      debugShowCheckedModeBanner: false,
      title: appName,
      initialRoute: AppPages.initial,
      theme: Themes().lightTheme,
      enableLog: true,
      getPages: AppPages.routes,
    );
  }
}
