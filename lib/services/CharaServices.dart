import 'dart:convert';

import 'package:flutter_application_1/models/CharModel.dart';
import 'package:http/http.dart' as http;

class CharacterServices {
  Future<List<CharacterModel>> getCharter() async {
    http.Response res = await http.get(
      Uri.parse('https://rickandmortyapi.com/api/character'),
    );
    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);
      List<dynamic> resultes = data['results'];
      List<CharacterModel> characters = [];
      // add list of models
      for (int i = 0; i < resultes.length; i++) {
        characters.add(CharacterModel.fromJson(resultes[i]));
      }
      return characters;
    } else {
      throw Exception('${res.statusCode} is not a valid');
    }
  }
}
