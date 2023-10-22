import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubite/cubit/charcter_cubit.dart';
import 'package:flutter_application_1/pages/Char-Detiles-Page.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/services/CharaServices.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const RickandMortyApp());
  // await CharacterServices().getCharter();
  // print("successfully");
}

class RickandMortyApp extends StatelessWidget {
  const RickandMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharcterCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Home.id: (context) => const Home(),
          CharcDetilesPage.id: (context) => const CharcDetilesPage()
        },
        initialRoute: Home.id,
      ),
    );
  }
}
