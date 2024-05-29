import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class SchoolDoc extends StatefulWidget {
  const SchoolDoc({Key? key}) : super(key: key);

  @override
  State<SchoolDoc> createState() => _SchoolDocState();
}

class _SchoolDocState extends State<SchoolDoc> {
  XFile? _image; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화
  String scannedText = "";  // textRecognizer로 인식된 텍스트를 담을 String
  String imageLabel = "";

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });
      getRecognizedText(_image!); // 이미지를 가져온 뒤 텍스트 인식 실행
    }

  }

  void getRecognizedText(XFile image) async {
    //     // XFile 이미지를 InputImage 이미지로 변환
    final InputImage inputImage = InputImage.fromFilePath(image.path);

    final textRecognizer =
    GoogleMlKit.vision.textRecognizer(script: TextRecognitionScript.latin);

    RecognizedText recognizedText =
    await textRecognizer.processImage(inputImage);

    // Release resources
    await textRecognizer.close();

    setState(() {
      scannedText = "";
      if (recognizedText.blocks.isNotEmpty) {
        scannedText = recognizedText.blocks.first.lines.first.text;
      }
      _locationController.text = scannedText;
    });
  }


  Future getImageforLabels(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });
      getImageLabels(_image!); // 이미지를 가져온 뒤 텍스트 인식 실행
    }
    else{
      print("image is null");
    }

  }

  void getImageLabels(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    ImageLabeler imageLabeler = ImageLabeler(options: ImageLabelerOptions());
    List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
    imageLabeler.close();
    setState(() {
      if (labels.isNotEmpty) {
        ImageLabel firstLabel = labels.first;
        String lblText = firstLabel.label;
        //double confidence = firstLabel.confidence;
        //'$lblText : ${(confidence * 100).toStringAsFixed(2)}%';
        imageLabel = '$lblText is destroyed';
      } else {
        imageLabel = 'Not found';
      }
      _contentController.text = imageLabel;
    });
  }

  final _placeController = TextEditingController();
  final _contentController = TextEditingController();
  final _locationController = TextEditingController();

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
                          controller: _placeController,
                          decoration: const InputDecoration(
                            floatingLabelBehavior:FloatingLabelBehavior.always,
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'PLACE',
                            hintText: 'EX:) NTH',
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
                        padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                        child: TextField(
                          controller: _locationController,
                          decoration: const InputDecoration(
                            floatingLabelBehavior:FloatingLabelBehavior.always,
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'LOCATION',
                            hintText: 'EX:) 313',
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
                      Stack(
                        children: [
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(305, 22, 0, 0),
                            child: OutlinedButton(onPressed: (){
                              getImageforLabels(ImageSource.gallery);
                              //  _locationController.text = scannedText;
                              //Navigator.pushReplacementNamed(context, '/dormitoryDoc');
                            }, child: const Icon(Icons.camera_alt_outlined,color: Color(0xFF0E4DA4),),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(color: Color(0xFF0E4DA4),
                                  ),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),
                                )
                            ),
                          ),
                          //Text(imageLabel)
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(onPressed: (){
                            getImage(ImageSource.gallery);
                            //  _locationController.text = scannedText;
                            //Navigator.pushReplacementNamed(context, '/dormitoryDoc');
                          }, child: const Icon(Icons.camera_alt_outlined,color: Colors.white,),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Color(0xFF0E4DA4),
                                side: const BorderSide(color: Color(0xFF0E4DA4),
                                ),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                ),
                              )
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          OutlinedButton(onPressed: (){
                            FirebaseFirestore.instance.collection("school").add(<String,dynamic>{
                              'place': _placeController.text,
                              'location': _locationController.text,
                              'content': _contentController.text,
                              'writer': FirebaseAuth.instance.currentUser!.email,
                              'uid': FirebaseAuth.instance.currentUser!.uid,
                              'time': FieldValue.serverTimestamp()
                            }).then((value) => print("Posting"));
                          },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Color(0xFF0E4DA4),
                                side: const BorderSide(color: Color(0xFF0E4DA4),
                                ),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                ),
                              ), child: const Icon(Icons.edit,color: Colors.white,)
                          ),

                        ],
                      ),
                    ],
                  ),
                ],
              )
          )
      ),
    );
  }
}
