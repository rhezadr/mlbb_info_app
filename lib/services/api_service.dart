import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mlbb_info_app/models/allhero_models.dart';
import 'package:mlbb_info_app/models/allrole_models.dart';
import 'package:mlbb_info_app/models/herodetails_model.dart';

class APIservice {
  final String baseUrl = 'https://api.dazelpro.com/';

  Future<AllHero> getAllHero() async {
    var allhero;

    final response = await http.get(
      Uri.parse('$baseUrl/mobile-legends/hero'),
    );

    if (response.statusCode == 200) {
      final jsonString = response.body;
      final jsonMap = json.decode(jsonString);

      allhero = AllHero.fromJson(jsonMap);
    } else {}
    return allhero;
  }

  Future<AllRole> getRoleHero(role) async {
    var allrole;
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/mobile-legends/role?roleName=$role'),
      );

      if (response.statusCode == 200) {
        final jsonString = response.body;
        final jsonMap = json.decode(jsonString);

        allrole = AllRole.fromJson(jsonMap);
      } else {}
    } catch (e) {
      print(e.toString());
    }
    return allrole;
  }

  Future<HeroDetails> getDetailsHero(id) async {
    var details;
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/mobile-legends/hero/$id'),
      );

      if (response.statusCode == 200) {
        final jsonString = response.body;
        final jsonMap = json.decode(jsonString);

        details = HeroDetails.fromJson(jsonMap);
      } else {}
    } catch (e) {
      print(e.toString());
    }
    return details;
  }
}
