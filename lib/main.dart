import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


void main() {
  runApp(new MaterialApp(
    title: "Fettch Health Card UI",
    home: LandingScreen(),
  ));
}

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  File imageFile;

  _openGallary(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });    
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(context: context,builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Upload Options"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Gallary"),
                  onTap: (){
                    _openGallary(context);
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: (){
                    _openCamera(context);
                  },
                )
              ],) ,)
        );
    });
  }

  Widget _decideImageView() {
    if(imageFile == null) {
      return Container (
        height: 20.0,
          child: Text(
            'No Card Selected',
             style: TextStyle(
             color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'),
          ),
        );
    } else {
      return Image.file(imageFile, width:300, height:300);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fettch Prescription Service"),
        backgroundColor: Color(0xFF151026),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              _decideImageView(),
              Container (
                height: 40.0,
                child: Material (
                  borderRadius: BorderRadius.circular(40.0),
                  shadowColor: Colors.black,
                  color: Colors.black,
                  elevation: 7.0,
                    child: RaisedButton(
                      onPressed: () { _showChoiceDialog(context);}, 
                      color: Colors.black,
                      child: Text("Attach Health Card", 
                        style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),),
                    )
                )
              ),
              Container (
                width: 350.0,
                child: TextField(
                  decoration: InputDecoration(
                  labelText: 'Name',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                ),
              ),
              Container (
                width: 350.0,
                child: TextField(
                  decoration: InputDecoration(
                  labelText: 'Health Card ID',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                ),
              ),
              Container(
                height: 40.0,
                width: 100.0,
                  child: Material(
                    shadowColor: Colors.black,
                    color: Colors.black,
                    elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                            ),
                          ),
                      ),
                  ),
              ),
            ],
        ),
        )
        
      )
    );
  }
}

