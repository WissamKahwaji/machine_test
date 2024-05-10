import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/domain/core/utils/network/app_environment.dart';
import 'package:machine_test/injection.dart';
import 'package:machine_test/presentation/land_info/screens/land_info_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(AppEnvironment.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'Poppins',
          ),
          home: const LandInfoScreen(),
        );
      },
    );
  }
}
