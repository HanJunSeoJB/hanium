import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:provider/provider.dart';
import 'package:travel_anywhere/providers/chats_provider.dart';
import 'package:travel_anywhere/providers/models_provider.dart';
import 'package:travel_anywhere/screens/book_screen.dart';
import 'package:travel_anywhere/screens/chat_screen.dart';
import 'package:travel_anywhere/screens/confirm.dart';
import 'package:travel_anywhere/screens/confirm_reset.dart';

import 'package:travel_anywhere/screens/entry.dart';
import 'package:travel_anywhere/screens/main_screen.dart';
import 'package:travel_anywhere/screens/survey_screen.dart';
import 'package:travel_anywhere/services/google_map.dart';
import 'login/lgin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line
  await configureAmplify(); // Make sure Amplify is configured before runApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: GetMaterialApp(
        title: '떠나볼래',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => EntryScreen()),
          GetPage(name: '/chatScreen', page: () => const ChatScreen()),
          GetPage(name: '/survey', page: () => SurveyPage()),
          GetPage(name: '/main', page: () => MainScreen()),
          GetPage(name: '/map', page: () => MapScreen()),
          GetPage(name: '/reservation', page: () => ReservationPage()),
          GetPage(name: '/confirm-reset', page: () => ConfirmResetScreen()),
          GetPage(name: '/confirm', page: () => ConfirmScreen()),
        ],
      ),
    );
  }
}
