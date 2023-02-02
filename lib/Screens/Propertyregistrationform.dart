import 'package:flutter/material.dart';
import  'package:intl/intl.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? BHK;

  TextEditingController building_name = TextEditingController();
  TextEditingController flat_number = TextEditingController();
  TextEditingController floor_number = TextEditingController();
  TextEditingController address_property = TextEditingController();
  TextEditingController registration_number = TextEditingController();

  @override
  void initState() {
    building_name.text = ""; //initail value of text field
    flat_number.text = "";
    floor_number.text = "";
    address_property.text = "";
    registration_number.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Property Reistration Form"),
          backgroundColor: Colors.purpleAccent,
        ),

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                    controller: building_name,
                    decoration: InputDecoration(
                      labelText: "Building Name",
                      prefixIcon: Icon(Icons.home),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                TextField(
                    controller: flat_number,
                    decoration: InputDecoration(
                      labelText: "Flat Number",
                      prefixIcon: Icon(Icons.home),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                Text("BHK", style: TextStyle(
                    fontSize: 20
                ),),

                RadioListTile(
                  title: Text("1 RK"),
                  value: "1 RK",
                  groupValue: BHK,
                  onChanged: (value){
                    setState(() {
                      BHK = value.toString();
                    });
                  },
                ),

                RadioListTile(
                  title: Text("2 BHK"),
                  value: "2 BHK",
                  groupValue: BHK,
                  onChanged: (value){
                    setState(() {
                      BHK = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("3 BHK"),
                  value: "3 BHK",
                  groupValue: BHK,
                  onChanged: (value){
                    setState(() {
                      BHK = value.toString();
                    });
                  },
                ),
                Divider(),
                TextField(
                    controller: registration_number,
                    decoration: InputDecoration(
                      labelText: "Property Registration Number",
                      prefixIcon: Icon(Icons.numbers),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                
                Container(height:20),
              ],
            ),
          ),
        )
    );
  }

  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Colors.deepPurple,
          width: 3,
        )
    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Colors.deepPurple,
          width: 3,
        )
    );
  }

//create a function like this so that you can use it wherever you want
}