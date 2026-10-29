import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'providers/favorit_provider.dart';
import 'cubits/belanja_cubit.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const EcoMartApp());
}

class EcoMartApp extends StatelessWidget {
  const EcoMartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritProvider()),
        BlocProvider(create: (_) => KeranjangCubit()),
      ],
      child: MaterialApp(
        title: 'EcoMart',
        theme: ThemeData(
          primarySwatch: Colors.green,
          useMaterial3: false,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}