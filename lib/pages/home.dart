import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/cubite/cubit/charcter_cubit.dart';
import 'package:flutter_application_1/models/CharModel.dart';
import 'package:flutter_application_1/services/CharaServices.dart';
import 'package:flutter_application_1/widgites/card.dart';
import 'package:flutter_application_1/widgites/graidListViwe.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static String id = 'home';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // var listCharter =  BlocProvider.of<CharcterCubit>(context).getCharter();
  late var listCharter;
  // new list to add searched Charter
  var serchedCharacter;
  // =================== to do search app bar
  late List<CharacterModel> allCharter;
  bool isSearching = false;
  final textEditingController = TextEditingController();

// ========================= texr fild appBar
  Widget buildSearch() {
    return TextField(
        controller: textEditingController,
        cursorColor: kGrey,
        style: TextStyle(color: kGrey, fontSize: 18),
        decoration: InputDecoration(
          hintText: "Finad a Character",
          border: InputBorder.none,
          hintStyle: TextStyle(color: kWhite),
        ),
        onChanged: (value) {
          addSearchItemToSearchedList(value);
        });
  }

  // ================================== filtering data
  addSearchItemToSearchedList(String searchedCharacter) async {
    serchedCharacter = allCharter
        .where((charter) =>
            charter.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  // ============= build  AppBar  Icon
  List<Widget> buildAppBarIcon() {
    if (isSearching) {
      return [
        IconButton(
          icon: Icon(
            Icons.clear,
            color: kGrey,
          ),
          onPressed: () {
            isSearching = false;
            textEditingController.clear();
            Navigator.pop;
            setState(() {});
          },
        )
      ];
    } else {
      return [
        IconButton(
          icon: Icon(
            Icons.search,
            color: kGrey,
          ),
          onPressed: () {
            startSearch();
            isSearching = true;
            setState(() {});
          },
        )
      ];
    }
  }

  startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch()));
  }

  stopSearch() {
    textEditingController.clear();
    setState(() {
      isSearching = true;
    });
  }

  Widget buildAppbarTitel() {
    return Text(
      'Charcters',
      style: TextStyle(color: kGrey),
    );
  }

// =============end Search app Bar =================
  @override
  void initState() {
    BlocProvider.of<CharcterCubit>(context).getCharter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // listCharter = BlocProvider.of<CharcterCubit>(context).getCharter();
    return Scaffold(
        backgroundColor: kGrey,
        appBar: AppBar(
            actions: buildAppBarIcon(),
            leading: isSearching
                ? BackButton(
                    color: kGrey,
                  )
                : Container(),
            backgroundColor: kWhite,
            title: isSearching ? buildSearch() : buildAppbarTitel()),
        body: BlocBuilder<CharcterCubit, CharcterState>(
          builder: (context, state) {
            if (state is CharcterSuccess) {
              allCharter = state.SuccessList;
              return GridListviwe(
                  textEditingController: textEditingController,
                  allCharter: allCharter,
                  serchedCharacter: serchedCharacter);
            } else if (state is CharcterLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text('There is an error'),
              );
            }
          },
        ));
  }
}
