import 'package:basilbaby/core/constants/theme_data.dart';
import 'package:basilbaby/core/routes.dart';
import 'package:basilbaby/view_models/timeline_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimelineModel()),
      ],
      child: MaterialApp.router(
        title: 'Basil Baby',
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: themeData,
      ),
    );
  }
}
