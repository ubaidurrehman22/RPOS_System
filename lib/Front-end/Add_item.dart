import 'package:flutter/material.dart';
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home.dart';
import 'package:image_picker/image_picker.dart';
import '../Database/add_item.dart';

class AddItem extends StatefulWidget {
  final Widget child;

  AddItem({Key key, this.child}) : super(key: key);

  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController name_control = new TextEditingController();
  TextEditingController id_control = new TextEditingController();
  TextEditingController category_control = new TextEditingController();

  String _id, _name, _category;
  File _image;
  bool name_validate = false;
  bool id_validate = false;
  bool category_validate = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF2BD093),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 10),
                  child: Text('Add Item',
                      style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ))),

              Container(
                height: 100,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                ),
                child: _image == null
                    ? Text(
                        "Add Image",
                        style: TextStyle(color: Colors.amber),
                      )
                    : Image.file(_image),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.info),
                      labelText: 'Item ID*',
                      errorText: id_validate ? 'Enter ID Of Item' : null,
                      fillColor: Colors.greenAccent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  controller: id_control,
                  keyboardType: TextInputType.number,
                  onChanged: (v) => _id = v,
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.add_box),
                      labelText: 'Item Name*',
                      fillColor: Colors.indigo,
                      errorText: name_validate ? 'Enter name of Item' : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: name_control,
                    keyboardType: TextInputType.text,
                    onChanged: (v) => _name = (v),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: DropdownButtonFormField(
                    value: 'ubad',
                    decoration: InputDecoration(
                        errorText: category_validate? 'Select Category': null,
                        icon: Icon(Icons.category),
                        fillColor: Colors.black,
                        labelText: 'Category',
                        labelStyle: TextStyle(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    items: null,
                    onChanged: (v) => _category = v,
                    
                  )),
              new Container(
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: new RaisedButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    splashColor: Colors.cyanAccent,
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                      size: 24,
                    ),
                    color: Color(0XFF2BD093),
                    animationDuration: Duration(seconds: 10),
                    onPressed: () {
                      setState(() {
                        id_control.text.isEmpty
                            ? id_validate = true
                            : id_validate = false;
                        name_control.text.isEmpty
                            ? name_validate = true
                            : name_validate = false;
                        
                      });
                      if(id_validate ==name_validate && name_validate==false){
                            additem(_id,_name,_category);
                      }
                    },
                    label: Text(
                      'Add Item',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
             
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addimage,
        backgroundColor: Color(0XFF2BD093),
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  addimage() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = img;
    });
  }
}
