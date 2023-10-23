import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/CharModel.dart';
import 'package:flutter_application_1/widgites/card.dart';

class GridListviwe extends StatelessWidget {
  const GridListviwe({
    super.key,
    required this.textEditingController,
    required this.allCharter,
    required this.serchedCharacter,
  });

  final TextEditingController textEditingController;
  final List<CharacterModel> allCharter;
  final serchedCharacter;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: textEditingController.text.isEmpty
          ? allCharter.length
          : serchedCharacter.length,
      padding: EdgeInsets.zero,
      clipBehavior: Clip.none,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 1),
      itemBuilder: (context, index) {
        return MyCard(
          charter: textEditingController.text.isEmpty
              ? allCharter[index]
              : serchedCharacter[index],
        );
      },
    );
  }
}
