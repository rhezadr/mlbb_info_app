// To parse this JSON data, do
//
//     final heroDetails = heroDetailsFromJson(jsonString);

import 'dart:convert';

HeroDetails heroDetailsFromJson(String str) => HeroDetails.fromJson(json.decode(str));

String heroDetailsToJson(HeroDetails data) => json.encode(data.toJson());

class HeroDetails {
    HeroDetails({
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

    factory HeroDetails.fromJson(Map<String, dynamic> json) => HeroDetails(
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
        required this.heroOverview,
    });

    int heroId;
    String heroName;
    String heroAvatar;
    String heroRole;
    String heroSpecially;
    HeroOverview heroOverview;

    factory Hero.fromJson(Map<String, dynamic> json) => Hero(
        heroId: json["hero_id"],
        heroName: json["hero_name"],
        heroAvatar: json["hero_avatar"],
        heroRole: json["hero_role"],
        heroSpecially: json["hero_specially"],
        heroOverview: HeroOverview.fromJson(json["hero_overview"]),
    );

    Map<String, dynamic> toJson() => {
        "hero_id": heroId,
        "hero_name": heroName,
        "hero_avatar": heroAvatar,
        "hero_role": heroRole,
        "hero_specially": heroSpecially,
        "hero_overview": heroOverview.toJson(),
    };
}

class HeroOverview {
    HeroOverview({
        required this.heroDurability,
        required this.heroOffence,
        required this.heroAbility,
        required this.heroDifficulty,
    });

    int heroDurability;
    int heroOffence;
    int heroAbility;
    int heroDifficulty;

    factory HeroOverview.fromJson(Map<String, dynamic> json) => HeroOverview(
        heroDurability: json["hero_durability"],
        heroOffence: json["hero_offence"],
        heroAbility: json["hero_ability"],
        heroDifficulty: json["hero_difficulty"],
    );

    Map<String, dynamic> toJson() => {
        "hero_durability": heroDurability,
        "hero_offence": heroOffence,
        "hero_ability": heroAbility,
        "hero_difficulty": heroDifficulty,
    };
}
