// To parse this JSON data, do
//
//     final heroAll = heroAllFromJson(jsonString);

import 'dart:convert';

AllHero heroAllFromJson(String str) => AllHero.fromJson(json.decode(str));

String heroAllToJson(AllHero data) => json.encode(data.toJson());

class AllHero {
    AllHero({
        required this.success,
        required this.status,
        required this.rowCount,
        required this.message,
        required this.hero,
    });

    bool success;
    int status;
    int rowCount;
    String message;
    List<Hero> hero;

    factory AllHero.fromJson(Map<String, dynamic> json) => AllHero(
        success: json["success"],
        status: json["status"],
        rowCount: json["rowCount"],
        message: json["message"],
        hero: List<Hero>.from(json["hero"].map((x) => Hero.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "rowCount": rowCount,
        "message": message,
        "hero": List<dynamic>.from(hero.map((x) => x.toJson())),
    };
}

class Hero {
    Hero({
        required this.heroId,
        required this.heroName,
        required this.heroAvatar,
        required this.heroRole,
        required this.heroSpecially,
    });

    int heroId;
    String heroName;
    String heroAvatar;
    String heroRole;
    String heroSpecially;

    factory Hero.fromJson(Map<String, dynamic> json) => Hero(
        heroId: json["hero_id"],
        heroName: json["hero_name"],
        heroAvatar: json["hero_avatar"],
        heroRole: json["hero_role"],
        heroSpecially: json["hero_specially"],
    );

    Map<String, dynamic> toJson() => {
        "hero_id": heroId,
        "hero_name": heroName,
        "hero_avatar": heroAvatar,
        "hero_role": heroRole,
        "hero_specially": heroSpecially,
    };
}
