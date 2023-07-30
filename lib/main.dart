import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'navbar_provider/navbar_provider.dart';
import 'theme_provider/app_theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(Utils.backendUrl);

    return MaterialApp(
        title: 'Code Solver',
        // darkTheme: MyThemes.darkTheme,
        theme: appPrimaryTheme(),
        debugShowCheckedModeBanner: false,
    // themeMode: themeProvider.themeMode,

         home: NavigationLayout(),

    builder: EasyLoading.init(),
    );
  }
}
