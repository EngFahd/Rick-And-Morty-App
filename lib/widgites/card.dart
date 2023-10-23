import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/models/CharModel.dart';
import 'package:flutter_application_1/pages/Char-Detiles-Page.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.charter,
  });
  final CharacterModel charter;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('successfully');
        Navigator.pushNamed(context, CharcDetilesPage.id, arguments: charter);
      },
      child: Container(
        padding: const EdgeInsetsDirectional.all(10),
        margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        // height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: GridTile(
          footer: Hero(
            tag: charter.id,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              height: 20,
              color: Colors.black45,
              child: Text(
                '${charter.name}',
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            color: kGrey,
            height: double.infinity,
            width: double.infinity,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/loading.gif',
              image: charter.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
