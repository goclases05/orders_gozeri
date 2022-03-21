import 'package:app_orders/components/background_stack.dart';
import 'package:app_orders/providers/departamentos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light));

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=>DepartamentoProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: 'Stack',
      routes: {
        'Stack': (_) => const BackgroundStack(),
        'Create_Orders': (_) => const BackgroundStack(),
      },
    );
  }
}
