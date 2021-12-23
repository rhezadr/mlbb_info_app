import 'package:flutter/material.dart';

import 'package:mlbb_info_app/constants/color_constants.dart';
import 'package:mlbb_info_app/constants/style_constants.dart';
import 'package:mlbb_info_app/models/allhero_models.dart';
import 'package:mlbb_info_app/models/allrole_models.dart';
import 'package:mlbb_info_app/models/herodetails_model.dart';
import 'package:mlbb_info_app/services/api_service.dart';

// ignore: must_be_immutable
class HeroGridView extends StatefulWidget {
  String? role;

  HeroGridView({Key? key, required this.role}) : super(key: key);

  @override
  State<HeroGridView> createState() => _HeroGridViewState();
}

class _HeroGridViewState extends State<HeroGridView> {
  final Future<AllHero> hero = APIservice().getAllHero();

  @override
  Widget build(BuildContext context) {
    return widget.role == 'Hero'
        ? FutureBuilder<AllHero>(
            future: hero,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    children: List.generate(snapshot.data!.rowCount, (index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Expanded(
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              child: Image.asset(
                                'assets/' +
                                    snapshot.data!.hero[index].heroName
                                        .toLowerCase()
                                        .toString() +
                                    '.png',
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return showDetails(
                                        snapshot.data!.hero[index].heroId);
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            snapshot.data!.hero[index].heroName,
                            style: hTextStyle2,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      );
                    }));
              } else {
                return Container(color: const Color.fromRGBO(9, 2, 51, 1));
              }
            })
        : FutureBuilder<AllRole>(
            future: APIservice().getRoleHero(widget.role),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    children: List.generate(snapshot.data!.rowCount, (index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Expanded(
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              child: Image.asset(
                                'assets/' +
                                    snapshot.data!.hero[index].heroName
                                        .toLowerCase()
                                        .toString() +
                                    '.png',
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return showDetails(
                                        snapshot.data!.hero[index].heroId);
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            snapshot.data!.hero[index].heroName,
                            style: hTextStyle2,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      );
                    }));
              } else {
                return Container(color: const Color.fromRGBO(9, 2, 51, 1));
              }
            });
  }

  Widget showDetails(id) {
    Size size = MediaQuery.of(context).size;
    List<String> details = [
      'Name',
      'Role',
      'Speciallity',
      'Laning Recommendation',
      'Overview'
    ];
    List<String> overview = ['Ability', 'Durability', 'Offense', 'Difficulty'];

    return FutureBuilder<HeroDetails>(
        future: APIservice().getDetailsHero(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String> detailsdata = [
              snapshot.data!.hero[0].heroName,
              snapshot.data!.hero[0].heroRole,
              snapshot.data!.hero[0].heroSpecially
            ];

            List<int> detailsOverview = [
              snapshot.data!.hero[0].heroOverview.heroAbility,
              snapshot.data!.hero[0].heroOverview.heroDurability,
              snapshot.data!.hero[0].heroOverview.heroOffence,
              snapshot.data!.hero[0].heroOverview.heroDifficulty,
            ];

            return Dialog(
              insetPadding: const EdgeInsets.only(left: 16, right: 16),
              backgroundColor: const Color.fromRGBO(9, 2, 51, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              elevation: 16,
              child: Wrap(children: [
                Container(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              child: IconButton(
                                color: goldColor,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.cancel_outlined),
                                iconSize: 30,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.topCenter,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'assets/' +
                                    snapshot.data!.hero[0].heroName
                                        .toLowerCase()
                                        .toString() +
                                    '.png',
                                fit: BoxFit.cover,
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          for (int i = 0; i < 5; i++)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  details[i] + ' :',
                                  style: hTextStyle3,
                                ),
                                details[i] != 'Overview'
                                    ? const SizedBox(height: 4)
                                    : const SizedBox(),
                                if (i == 4)
                                  for (int i = 0; i < 4; i++)
                                    Column(
                                      children: [
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              overview[i],
                                              style: hTextStyle5,
                                            ),
                                            Text(
                                              detailsOverview[i].toString(),
                                              style: hTextStyle6,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        showStat(
                                            detailsOverview[i].toInt(), size),
                                      ],
                                    )
                                else
                                  Text(
                                    i < 3
                                        ? detailsdata[i]
                                        : snapshot.data!.hero[0].heroRole
                                                    .contains('Tank') ||
                                                snapshot.data!.hero[0].heroRole
                                                    .contains('Support')
                                            ? 'Roam'
                                            : snapshot.data!.hero[0].heroRole
                                                    .contains('Mage')
                                                ? 'Mid Lane'
                                                : snapshot
                                                        .data!.hero[0].heroRole
                                                        .contains('Marksman')
                                                    ? 'Gold Lane, Jungle'
                                                    : snapshot.data!.hero[0]
                                                            .heroRole
                                                            .contains('Fighter')
                                                        ? 'Exp Lane'
                                                        : 'Jungle',
                                    style: hTextStyle4,
                                  ),
                                const SizedBox(height: 8),
                              ],
                            ),
                        ]))
              ]),
            );
          } else {
            return Dialog(
                insetPadding: const EdgeInsets.only(left: 16, right: 16),
                backgroundColor: const Color.fromRGBO(9, 2, 51, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                elevation: 16,
                child: SizedBox(
                  height: 695,
                  width: size.width,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ));
          }
        });
  }

  showStat(heroStat, size) {
    return Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0),
            border: Border.all(
              width: 3,
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        height: 20,
        width: size.width,
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: goldColor,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              width: size.width / 131 * heroStat,
              height: 30,
            )
          ],
        ));
  }
}
