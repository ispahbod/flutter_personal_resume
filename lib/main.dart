import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Default to the system theme mode
  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = Locale('en');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      themeMode: _themeMode,
      theme: MyAppThemeConfig.light().getTheme(_locale.languageCode),
      darkTheme: MyAppThemeConfig.dark().getTheme(_locale.languageCode),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            // Toggle between light and dark theme modes
            _themeMode = (_themeMode == ThemeMode.light)
                ? ThemeMode.dark
                : ThemeMode.light;
          });
        },
        selectedLanguageChanged: (_Language newSelectedLanguage) {
          setState(() {
            _locale = newSelectedLanguage == _Language.en
                ? Locale('en')
                : Locale('fa');
          });
        },
      ),
    );
  }
}

class MyAppThemeConfig {
  static const String faPrimaryFontFamily = "IranYekan";

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

  ThemeData getTheme(String languageCode) {
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
      textTheme:
          languageCode == "en" ? enPrimaryTextTheme() : faPrimaryTextTheme(),
    );
  }
}

TextTheme enPrimaryTextTheme() {
  return GoogleFonts.latoTextTheme(
    TextTheme(
      bodyText2: TextStyle(fontSize: 15),
      bodyText1:
          TextStyle(fontSize: 13, color: Color.fromARGB(200, 255, 255, 255)),
      headline6: TextStyle(fontWeight: FontWeight.w700),
      subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
    ),
  );
}

TextTheme faPrimaryTextTheme() {
  return TextTheme(
    bodyText2: TextStyle(
        fontSize: 15, fontFamily: MyAppThemeConfig.faPrimaryFontFamily),
    bodyText1: TextStyle(
        fontSize: 13,
        color: Color.fromARGB(200, 255, 255, 255),
        fontFamily: MyAppThemeConfig.faPrimaryFontFamily),
    headline6: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: MyAppThemeConfig.faPrimaryFontFamily),
    subtitle1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w900,
        fontFamily: MyAppThemeConfig.faPrimaryFontFamily),
  );
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;
  final Function(_Language _language) selectedLanguageChanged;

  const MyHomePage({
    Key? key,
    required this.toggleThemeMode,
    required this.selectedLanguageChanged,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum _SkillType { photoshop, xd, illustrator, afterEffect, lightroom }

enum _Language { en, fa }

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skill = _SkillType.photoshop;
  _Language _language = _Language.en;

  void _updateSelectedSkill(_SkillType type) {
    setState(() {
      this._skill = type;
    });
  }

  void _updateSelectedLanguage(_Language lang) {
    widget.selectedLanguageChanged(lang);
    setState(() {
      this._language = lang;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localization.profileTitle,
          style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black),
        ),
        actions: [
          InkWell(
            onTap: widget.toggleThemeMode,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
              child: Icon(CupertinoIcons.brightness),
            ),
          ),
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
                            localization.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            localization.job,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Row(children: [
                            Icon(
                              CupertinoIcons.location,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              size: 14,
                            ),
                            SizedBox(width: 6),
                            Text(
                              localization.location,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context)
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
                    color: Theme.of(context).primaryColor,
                    size: 32,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
              child: Text(
                localization.summary,
                style: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(children: [
                Expanded(
                  child: Text(
                    localization.selectLanguage,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1?.color,
                          fontWeight: FontWeight.w800),
                  ),
                ),
                CupertinoSlidingSegmentedControl<_Language>(
                    groupValue: _language,
                    children: {
                      _Language.en: Text(localization.enLanguage),
                      _Language.fa: Text(localization.faLanguage),
                    },
                    onValueChanged: (value) => _updateSelectedLanguage(value!))
              ]),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(children: [
                Text(
                  localization.skills,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800),
                ),
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
                      type: _SkillType.photoshop,
                      title: 'photoShop',
                      path: 'images/app_icon_01.png',
                      shadowColor: Color.fromARGB(20, 255, 255, 255),
                      isActive: _skill == _SkillType.photoshop,
                      onTab: () {
                        _updateSelectedSkill(_SkillType.photoshop);
                      },
                    ),
                    Skill(
                      type: _SkillType.lightroom,
                      title: 'LightRoom',
                      path: 'images/app_icon_02.png',
                      shadowColor: Color.fromARGB(20, 255, 255, 255),
                      isActive: _skill == _SkillType.lightroom,
                      onTab: () {
                        _updateSelectedSkill(_SkillType.lightroom);
                      },
                    ),
                    Skill(
                      type: _SkillType.afterEffect,
                      title: 'After Effect',
                      path: 'images/app_icon_03.png',
                      shadowColor: Color.fromARGB(20, 255, 255, 255),
                      isActive: _skill == _SkillType.afterEffect,
                      onTab: () {
                        _updateSelectedSkill(_SkillType.afterEffect);
                      },
                    ),
                    Skill(
                      type: _SkillType.illustrator,
                      title: 'Illustrator',
                      path: 'images/app_icon_04.png',
                      shadowColor: Color.fromARGB(20, 255, 255, 255),
                      isActive: _skill == _SkillType.illustrator,
                      onTab: () {
                        _updateSelectedSkill(_SkillType.illustrator);
                      },
                    ),
                    Skill(
                      type: _SkillType.xd,
                      title: 'Adobe XD',
                      path: 'images/app_icon_05.png',
                      shadowColor: Color.fromARGB(20, 255, 255, 255),
                      isActive: _skill == _SkillType.xd,
                      onTab: () {
                        _updateSelectedSkill(_SkillType.xd);
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
                Text(
                  localization.login,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: localization.email,
                      prefixIcon: Icon(CupertinoIcons.at),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      labelText: localization.password,
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
                          localization.save,
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
  final _SkillType type;
  final String title;
  final String path;
  final Color shadowColor;
  final bool isActive;
  final Function() onTab;

  const Skill({
    Key? key,
    required this.type,
    required this.title,
    required this.path,
    required this.shadowColor,
    required this.onTab,
    required this.isActive,
  }) : super(key: key);

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
                color: shadowColor, borderRadius: BorderRadius.circular(12))
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
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          )
        ]),
      ),
    );
  }
}
