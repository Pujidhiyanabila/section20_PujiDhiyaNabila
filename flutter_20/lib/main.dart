import 'package:flutter/material.dart';
import 'package:flutter_20/home_page.dart';
import 'package:provider/provider.dart';
import 'stores/contact.dart' as contact_store;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => contact_store.Contact(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Phone Book App',
      home: HomePage(),
    );
  }
}