import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lubby/app/src/modules/home/home_store.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeStore>(
          create: (_) => HomeStore(),
        )
      ],
      child: MaterialApp(
        title: 'Lubby',
        theme: ThemeData(primarySwatch: Colors.blue),
      ).modular(),
    );
  }
}
