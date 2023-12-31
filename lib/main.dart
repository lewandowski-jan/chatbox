import 'package:chatbox/chat.dart';
import 'package:chatbox/data/data_repository.dart';
import 'package:chatbox/data/db.dart';
import 'package:chatbox/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => DataRepository(
            database: RealtimeDatabase(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Chat(),
    );
  }
}
