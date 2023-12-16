import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_beds/common/pages.dart';
import 'package:smart_beds/common/util/shared_preferences/user_prefs.dart';

import 'common/theme/theme.dart';
import 'features/shared/controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Get.put<SharedController>(SharedController());
  final UserPrefs userPrefs = UserPrefs();
  await userPrefs.loadUserData();

  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return GetMaterialApp(
          theme: AppTheme.themeData,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.sign,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
