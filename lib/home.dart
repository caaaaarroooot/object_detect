import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moapp_project/calender.dart';
import 'package:moapp_project/dormitory.dart';
import 'package:moapp_project/post.dart';
import 'package:moapp_project/school.dart';

import 'office.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0E4DA4),
          title: const Text('Main Page'),
          actions: <Widget>[
            IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CalenderPage()),
            );}, icon: const Icon(Icons.calendar_month_outlined)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.search))
          ],
        ),
        drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: const CircleAvatar(
                    // 현재 계정 이미지 set
                    backgroundImage: AssetImage('assets/profile.jpg'), //TODO set profile image
                    backgroundColor: Colors.white,
                  ),
                  accountName: Text('박정훈 학부생'),
                  accountEmail: Text('21900304@handong.ac.kr'),
                  onDetailsPressed: () {
                    print('arrow is clicked');
                  },
                  decoration: const BoxDecoration(
                      color: Color(0xFF0E4DA4),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0))),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.grey[850],
                  ),
                  title: Text('Home'),
                  onTap: () {
                    print('Home is clicked');
                  },
                  trailing: Icon(Icons.arrow_right_alt_outlined),
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.grey[850],
                  ),
                  title: Text('Setting'),
                  onTap: () {
                    print('Setting is clicked');
                  },
                  trailing: Icon(Icons.arrow_right_alt_outlined),
                ),
                ListTile(
                  leading: Icon(
                    Icons.question_answer,
                    color: Colors.grey[850],
                  ),
                  title: Text('Q&A'),
                  onTap: () {
                    print('Q&A is clicked');
                  },
                  trailing: Icon(Icons.arrow_right_alt_outlined),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.grey[850],
                  ),
                  title: Text('Account'),
                  onTap: () {
                    print('Account is clicked');
                  },
                  trailing: Icon(Icons.arrow_right_alt_outlined),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(
                    Icons.list,
                    color: Colors.grey[850],
                  ),
                  title: Text('내 민원 신청'),
                  onTap: () {
                   },
                  trailing: Icon(Icons.arrow_right_alt_outlined),
                ),
                ListTile(
                  leading: Icon(
                    Icons.notification_add_outlined,
                    color: Colors.grey[850],
                  ),
                  title: Text('접수 확인'),
                  onTap: () {
                    },
                  trailing: Icon(Icons.arrow_right_alt_outlined),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.grey[850],
                  ),
                  title: Text('Log Out'),
                  onTap: () {
                    },
                  trailing: Icon(Icons.arrow_right_alt_outlined),
                ),
              ],
            )
        ),
        body: Center(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.1,
                      child: Container(
                        child: Image.asset(
                          'assets/hgu.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(5, 30, 5, 0),
                      child: Container(
                          width: 460,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Color(0xFF0E4DA4),
                            border: Border.all(
                              color: Color(0xFF0E4DA4),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("공지 사항",style: TextStyle(fontSize: 24,color: Colors.white),),
                                SizedBox(
                                  height: 5,
                                ),
                                const Text("Card layouts can vary to support the types of content they contain layouts can vary to support they contain layouts can vary to support the types of content.",
                                    style: TextStyle(fontSize: 15,color: Colors.white)),
                                SizedBox(
                                  height: 10,
                                ),
                                OutlinedButton(onPressed: (){}, child: Text("More",style: TextStyle(fontSize: 14,color: Colors.white)),
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(color: Colors.white,
                                        ),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(5))
                                        )
                                    )
                                )
                              ],
                            ),
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 10, 0),
                      child: OutlinedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DormitoryPage()));},
                        child: const Text("기숙사 민원 신청",style: TextStyle(color: Color(0xFF0E4DA4),fontSize: 30),),
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF0E4DA4),
                            ),
                            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 10, 0),
                      child: OutlinedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SchoolPage()));},
                        child: const Text("학교시설 민원 신청",style: TextStyle(color: Color(0xFF0E4DA4),fontSize: 30),),
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF0E4DA4),
                            ),
                            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 10, 0),
                      child: OutlinedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => OfficePage()));},
                        child: const Text("총학생회 민원 신청",style: TextStyle(color: Color(0xFF0E4DA4),fontSize: 30),),
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF0E4DA4),
                            ),
                            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 25, 10, 0),
                      child: OutlinedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()));},
                        child: const Text("문의 게시판",style: TextStyle(color: Color(0xFF0E4DA4),fontSize: 30),),
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF0E4DA4),
                            ),
                            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
