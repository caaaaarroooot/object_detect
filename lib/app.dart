import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moapp_project/calender.dart';
import 'package:moapp_project/dormitory.dart';
import 'package:moapp_project/office.dart';
import 'package:moapp_project/officeDoc.dart';
import 'package:moapp_project/post.dart';
import 'package:moapp_project/postDoc.dart';
import 'package:moapp_project/schodlDoc.dart';
import 'package:moapp_project/school.dart';
import 'package:provider/provider.dart';

import 'dormitoryDoc.dart';
import 'home.dart';
import 'login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Shrine',
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext context) => LoginPage(),
          '/': (BuildContext context) => HomePage(),

          '/post': (BuildContext context) => PostPage(),
          '/postDoc': (BuildContext context) => PostDocPage(),

          '/dormitory': (BuildContext context) => DormitoryPage(),
          '/dormitoryDoc': (BuildContext context) => DormitoryDoc(),

          '/office': (BuildContext context) => OfficePage(),
          '/officeDoc': (BuildContext context) => OfficeDoc(),

          '/school': (BuildContext context) => SchoolPage(),
          '/schoolDoc': (BuildContext context) => SchoolDoc(),

          '/calender': (BuildContext context) => CalenderPage(),


        },
        theme: ThemeData.light(useMaterial3: true),
      )
    );
  }
}

class MyAppState extends ChangeNotifier {
  var dor = [];
  var office = [];
  var school = [];
  var post = [];

  void addDor(String text)
  {
    dor.add(text);
  }
  void addOffice(String text)
  {
    office.add(text);
  }
  void addSchool(String text)
  {
    school.add(text);
  }
  void addPost(String text)
  {
    post.add(text);
  }

}
//현재 google ml_kit의 text recognize로 사진 인식-> 트러블 슈팅이 굉장히 많이 일어남.
//다음 어떤 pub의 dependency를 사용??