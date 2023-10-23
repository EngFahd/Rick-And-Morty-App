import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/models/CharModel.dart';

class CharcDetilesPage extends StatelessWidget {
  const CharcDetilesPage({super.key});
  static String id = "CharcDetilesPage";
  @override
  Widget build(BuildContext context) {
    CharacterModel charcter =
        ModalRoute.of(context)!.settings.arguments as CharacterModel;
    return Scaffold(
      backgroundColor: kGrey,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          sliverAppBar(charcter: charcter),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DescriptionCharcter(
                      title: 'name : ',
                      value: charcter.status,
                    ),
                    const BuildDividor(inDent: 270),
                    DescriptionCharcter(
                      title: 'status : ',
                      value: charcter.name,
                    ),
                    BuildDividor(inDent: 270),
                    DescriptionCharcter(
                      title: 'species : ',
                      value: charcter.species,
                    ),
                    const BuildDividor(inDent: 250),
                    DescriptionCharcter(
                      title: 'gender : ',
                      value: charcter.gender,
                    ),
                    const BuildDividor(inDent: 250),
                    DescriptionCharcter(
                      title: 'location : ',
                      value: charcter.location,
                    ),
                    const BuildDividor(inDent: 250),
                    SizedBox(
                      height: 500,
                    )
                  ]),
            ),
          ]))
        ],
      ),
    );
  }
}

class sliverAppBar extends StatelessWidget {
  const sliverAppBar({
    super.key,
    required this.charcter,
  });

  final CharacterModel charcter;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      expandedHeight: 500,
      pinned: true,
      stretch: true,
      backgroundColor: kGrey,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: charcter.id,
          child: Image.network(
            charcter.image,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          charcter.name,
          style: TextStyle(color: kYellows),
        ),
      ),
    );
  }
}

class DescriptionCharcter extends StatelessWidget {
  const DescriptionCharcter(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
            text: title,
            style: TextStyle(
                color: kWhite, fontSize: 18, fontWeight: FontWeight.bold)),
        TextSpan(
            text: value,
            style: TextStyle(
              color: kWhite,
              fontSize: 16,
            ))
      ]),
    );
  }
}

class BuildDividor extends StatelessWidget {
  const BuildDividor({super.key, required this.inDent});
  final double inDent;
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      endIndent: inDent,
      color: kYellows,
      thickness: 2,
    );
  }
}
