import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loc/splash.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'langProvider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LangProvider())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _prlan = Provider.of<LangProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(_prlan.code),
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // Spanish, no country code
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(prlan: _prlan,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  LangProvider prlan;
  MyHomePage({required this.prlan}) ;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).name),
              ElevatedButton(
                onPressed: () {
                  widget.prlan.local = Locale("en");
                },
                child: Text("English"),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.prlan.local = Locale("ar");
                },
                child: Text("Arabic"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}