// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:online_tasklar/pages/6.2.vazifasi/detail_page.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();
//   runApp(
//     EasyLocalization(
//         supportedLocales:  const [
//           Locale('en', 'US'),
//           Locale('ru', 'RU'),
//           Locale('uz', 'UZ'),
//           Locale('fr', 'FR'),
//           Locale('ka', 'KR'),
//           Locale('jp', 'JP'),
//         ],
//         path: 'assets/translation',
//         fallbackLocale:  const Locale('en', 'US'),
//         child: const MyApp()
//     ),
//   );
// }
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         localizationsDelegates: context.localizationDelegates,
//         supportedLocales: context.supportedLocales,
//         locale: context.locale,
//         home: const HomePage(),
//         routes: {
//           HomePage.id: (context) => const HomePage(),
//         },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:online_tasklar/pages/6.1.vazifasi/home_page.dart';
// void main(){
//
//   runApp(const App());
// }
// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomePage(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:online_tasklar/pages/6.4.vazifalari/pages/booking_page.dart';
import 'package:online_tasklar/pages/6.4.vazifalari/pages/detail_page.dart';
import 'package:online_tasklar/pages/6.4.vazifalari/pages/home_page.dart';
import 'package:online_tasklar/pages/6.4.vazifalari/pages/result_page.dart';
void main() async {
  await Hive.initFlutter();
  await Hive.openBox("login_two");

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const BookingPage(),
      routes: {
        HomePage.id: (context) =>  const HomePage(),
        HomeAssignmentTwo.id: (context) =>  const HomeAssignmentTwo(),
        BookingPage.id: (context) => const BookingPage(),
        ResultPage.id: (context) => const ResultPage(),
      },
    );
  }
}



