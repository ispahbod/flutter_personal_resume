import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: _themeMode == ThemeMode.dark
          ? MyAppThemeConfig
          .dark()
          .getTheme
          : MyAppThemeConfig
          .light()
          .getTheme,
      home: MyHomePage(toggleThemeMode: () {
        setState(() {
          if (_themeMode == ThemeMode.dark) {
            _themeMode = ThemeMode.light;
          } else {
            _themeMode = ThemeMode.dark;
          }
        });
      }),
    );
  }
}

class MyAppThemeConfig {
  final primaryColor = Colors.pink.shade900;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceTextColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceTextColor = Color(0x0dffffff),
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceTextColor = Color(0x0d000000),
        backgroundColor = Colors.white,
        appBarColor = Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  ThemeData get getTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      primaryColor: primaryTextColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(backgroundColor: appBarColor),
      dividerColor: Colors.black54,
      dividerTheme: DividerThemeData(indent: 15, endIndent: 15, thickness: 1),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.pink),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.black26,
      ),
      textTheme: GoogleFonts.latoTextTheme(
        TextTheme(
            bodyText2: TextStyle(fontSize: 15),
            bodyText1: TextStyle(
                fontSize: 13, color: Color.fromARGB(200, 255, 255, 255)),
            headline6: TextStyle(fontWeight: FontWeight.w700),
            subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;

  const MyHomePage({Key? key, required this.toggleThemeMode}) : super(key: key);


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
          InkWell(
            onTap: widget.toggleThemeMode,
            child: Padding(
              // padding: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
              child: Icon(CupertinoIcons.brightness),
            ),
          ),
          // SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('images/profile.jpg',
                        width: 80, height: 80),
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
                              color:
                              Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color,
                              size: 14,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'IRAN - Esfahan',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                            ),
                          ])
                        ],
                      ),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: Theme
                        .of(context)
                        .primaryColor,
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
              padding: const EdgeInsets.all(15),
              child: Row(children: [
                Text('Skills',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w800)),
                SizedBox(width: 4),
                Icon(CupertinoIcons.chevron_down,
                    color: Colors.white, size: 16),
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
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(children: [
                Icon(CupertinoIcons.person, color: Colors.white, size: 16),
                SizedBox(width: 4),
                Text('Personal Information',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w800)),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(CupertinoIcons.at),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(CupertinoIcons.lock),
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "save",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
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

  const Skill({Key? key,
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
