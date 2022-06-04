import 'package:barcodescan_qrscan/providers/general_provider.dart';
import 'package:barcodescan_qrscan/utils/routes.dart';
import 'package:barcodescan_qrscan/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GeneralProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Barcode & Qr Scanner ',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        initialRoute: HomeView.ROUTE,
        routes: routes,
      ),
    );
  }
}
