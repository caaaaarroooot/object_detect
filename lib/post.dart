import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moapp_project/postDoc.dart';

class PostPage extends StatefulWidget {
  PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF0E4DA4),
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back),),
            title: const Text('문의 게시판'),
            actions: <Widget>[
              IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.search))
            ],
          ),
          body: Center(
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(5, 30, 5, 0),
                          child: Container(
                              width: 460,
                              height: 160,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ]
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("근로 학생 모집",style: TextStyle(fontSize: 24,color: Colors.black),),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    const Text("Card layouts can vary to support the types of content they contain layouts can vary to support they contain layouts can vary to support the types of content.",
                                        style: TextStyle(fontSize: 15,color: Colors.black)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    OutlinedButton(onPressed: (){}, child: Text("More",style: TextStyle(fontSize: 14,color: Color(0xFF0E4DA4))),
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(color: Color(0xFF0E4DA4),
                                          ),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              )
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //TODO snapshot
                        Expanded(
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance.collection('post').orderBy('time',descending: true).snapshots(), //TODO database에 timestamp 추가.
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                // 데이터가 아직 로드되지 않았을 때 로딩 상태 표시
                                return CircularProgressIndicator();
                              }
                              if (!snapshot.hasData) {
                                // 데이터가 없는 경우 표시할 내용
                                return Text('No data available');
                              }
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }
                              return ListView.builder(
                                itemCount: snapshot.data?.docs.length,
                                itemBuilder: (context, index) {
                                  final doc = snapshot.data?.docs[index];
                                  return Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          doc!['title'],
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                            doc!['content'],
                                            maxLines:1,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            )
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: const EdgeInsets.fromLTRB(0, 550, 0, 0),
                        child: OutlinedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PostDocPage()));}, child: Icon(Icons.edit,color: Colors.white,),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xFF0E4DA4),
                              side: const BorderSide(color: Color(0xFF0E4DA4),
                              ),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                            )
                        ),
                      ),
                    ],
                  )
                ],
              )
          )
      ),
    );
  }
}
