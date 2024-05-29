import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostDocPage extends StatefulWidget {
  PostDocPage({Key? key}) : super(key: key);

  @override
  State<PostDocPage> createState() => _PostDocPageState();
}

class _PostDocPageState extends State<PostDocPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF0E4DA4),
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back),),
            title: const Text('글 쓰기'),
            actions: <Widget>[
              IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.search))
            ],
          ),
          body: Center(
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          floatingLabelBehavior:FloatingLabelBehavior.always,
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'TITLE',
                          hintText: ' ',
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(width: 1, color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(width: 1, color: Colors.grey),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
                      child: TextField(
                        maxLines: 20,
                        minLines: 20,
                        controller: _contentController,
                        decoration: const InputDecoration(
                          floatingLabelBehavior:FloatingLabelBehavior.always,
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'CONTENT',
                          hintText: ' ',
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(width: 1, color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(width: 1, color: Colors.grey),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(onPressed: (){
                      FirebaseFirestore.instance.collection("post").add(<String,dynamic>{
                        'title': _titleController.text,
                        'content': _contentController.text,
                        'writer': FirebaseAuth.instance.currentUser!.email,
                        'uid': FirebaseAuth.instance.currentUser!.uid,
                        'time': FieldValue.serverTimestamp()
                      }).then((value) => print("Posting"));
                    }, child: Icon(Icons.edit,color: Colors.white,),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFF0E4DA4),
                          side: const BorderSide(color: Color(0xFF0E4DA4),
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                        )
                    )

                  ],
                ),
              ],
            )
          )
      ),
    );
  }
}
