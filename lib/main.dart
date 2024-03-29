import '/pages/launcher.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}



// ส่วนของ Stateless widget
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter App',
      initialRoute: 'home',
      routes: {
        Launcher.routeName: (context) => const Launcher(),
      },
    );
  }
}