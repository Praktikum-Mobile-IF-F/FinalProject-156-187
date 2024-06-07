import 'package:flutter/material.dart';
import 'helper/shared_preference.dart';
import 'model/data_model.dart';
import 'LoginRegisterPage/login_page.dart';
import 'view/homepage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initiateLocalDB();
  final bool isLoggedIn = await SharedPreference().getLoginStatus(); // Mengambil status login dari SharedPreference
  runApp(MyApp(isLoggedIn: isLoggedIn)); // Meneruskan status login ke MyApp
}

Future<void> initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>("data");
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({required this.isLoggedIn}); // Mendefinisikan parameter isLoggedIn

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drinktale',
      home: isLoggedIn ? HomePage() : LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
