import 'package:flutter/material.dart';
import 'package:flutter_application_5/view/pageui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  MaterialApp(
      title: 'contact app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.brown,
        
        )
      ),
      darkTheme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey
        )
      ),





      home:Mycontact(),
      
    );
  }
}
