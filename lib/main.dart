import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primaryColor: Colors.pink.shade600,
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        dividerColor: Colors.black54,
        dividerTheme: DividerThemeData(indent: 15, endIndent: 15, thickness: 1),
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
              bodyText2: TextStyle(fontSize: 15),
              bodyText1: TextStyle(
                  fontSize: 13, color: Color.fromARGB(200, 255, 255, 255)),
              headline6: TextStyle(fontWeight: FontWeight.w700),
              subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum SkillType { photoshop, xd, illustrator, afterEffect, lightroom }

class _MyHomePageState extends State<MyHomePage> {
  SkillType _skill = SkillType.photoshop;

  void updateSelectedSkill(SkillType type) {
    setState(() {
      this._skill = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Presonal Resume", style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            // padding: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
            child: Icon(CupertinoIcons.chat_bubble),
          ),
          // SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:
                      Image.asset('images/profile.jpg', width: 80, height: 80),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hamed Hadi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Full-stack web developer',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Row(children: [
                          Icon(
                            CupertinoIcons.location,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            size: 14,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'IRAN - Esfahan',
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                        ])
                      ],
                    ),
                  ),
                ),
                Icon(
                  CupertinoIcons.heart,
                  color: Theme.of(context).primaryColor,
                  size: 32,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
            child: Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(children: [
              Text('Skills',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800)),
              SizedBox(width: 4),
              Icon(CupertinoIcons.chevron_down, color: Colors.white, size: 16),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 12,
                runSpacing: 12,
                children: [
                  Skill(
                    type: SkillType.photoshop,
                    title: 'photoShop',
                    path: 'images/app_icon_01.png',
                    shadowColor: Color.fromARGB(20, 255, 255, 255),
                    isActive: _skill == SkillType.photoshop,
                    onTab: () {
                      updateSelectedSkill(SkillType.photoshop);
                    },
                  ),
                  Skill(
                    type: SkillType.lightroom,
                    title: 'LightRoom',
                    path: 'images/app_icon_02.png',
                    shadowColor: Color.fromARGB(20, 255, 255, 255),
                    isActive: _skill == SkillType.lightroom,
                    onTab: () {
                      updateSelectedSkill(SkillType.lightroom);
                    },
                  ),
                  Skill(
                    type: SkillType.afterEffect,
                    title: 'After Effect',
                    path: 'images/app_icon_03.png',
                    shadowColor: Color.fromARGB(20, 255, 255, 255),
                    isActive: _skill == SkillType.afterEffect,
                    onTab: () {
                      updateSelectedSkill(SkillType.afterEffect);
                    },
                  ),
                  Skill(
                    type: SkillType.illustrator,
                    title: 'Illustrator',
                    path: 'images/app_icon_04.png',
                    shadowColor: Color.fromARGB(20, 255, 255, 255),
                    isActive: _skill == SkillType.illustrator,
                    onTab: () {
                      updateSelectedSkill(SkillType.illustrator);
                    },
                  ),
                  Skill(
                    type: SkillType.xd,
                    title: 'Adobe XD',
                    path: 'images/app_icon_05.png',
                    shadowColor: Color.fromARGB(20, 255, 255, 255),
                    isActive: _skill == SkillType.xd,
                    onTab: () {
                      updateSelectedSkill(SkillType.xd);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Skill extends StatelessWidget {
  final SkillType type;
  final String title;
  final String path;
  final Color shadowColor;
  final bool isActive;
  final Function() onTab;

  const Skill(
      {Key? key,
      required this.type,
      required this.title,
      required this.path,
      required this.shadowColor,
      required this.onTab,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTab,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
                color: shadowColor,
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 20,
              )
            ]),
            child: Image.asset(
              path,
              width: 60,
              height: 60,
            ),
          ),
          SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w800),
          )
        ]),
      ),
    );
  }
}
