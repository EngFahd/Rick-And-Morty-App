import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant.dart';
import 'package:flutter_application_1/models/CharModel.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.product,
  });
  final CharacterModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      // height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          height: 20,
          color: Colors.black45,
          child: Text(
            '${product.name}',
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
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          color: kGrey,
          height: double.infinity,
          width: double.infinity,
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/loading.gif',
            image: product.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
