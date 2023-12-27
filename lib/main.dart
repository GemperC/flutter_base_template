import 'package:calendar_view/calendar_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supermegataxi/utils/utils.dart';
import 'package:supermegataxi/pages/home/home_view.dart';
import 'package:supermegataxi/pages/login/login_page.dart';

import 'backend/auth/auth_util.dart';
import 'backend/auth/firebase_user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = GetStorage();

  late Stream<LoginFirebaseUser> userStream;
  LoginFirebaseUser? initialUser;
  final authUserSub = authenticatedUserStream.listen((_) {});

  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userStream = loginFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    storage.writeIfNull('display_first_screen', true);
  }

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: Utils.messengerKey,
          theme: ThemeData.light(),
          home: (currentUser != null && currentUser!.loggedIn)
              ? HomeWidget()
              : LoginWidget()),
    );
  }
}
