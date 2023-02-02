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
  String? gender;
  String?occupation;
  String?smoker;
  String?drink;
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController father_name = TextEditingController();
  TextEditingController mother_name = TextEditingController();
  TextEditingController company_university = TextEditingController();
  TextEditingController interest_hobbies = TextEditingController();
  TextEditingController pancardnumber = TextEditingController();
  TextEditingController aadharcardnumber = TextEditingController();
  TextEditingController usercontact = TextEditingController();
  TextEditingController parent_guardian_number = TextEditingController();
  TextEditingController current_address = TextEditingController();
  TextEditingController permanent_address = TextEditingController();
  @override
  void initState() {
    first_name.text = ""; //innitail value of text field
    last_name.text = "";
    dateinput.text = "";
    father_name.text = "";
    mother_name.text = "";
    company_university.text = "";
    interest_hobbies.text = "";
    pancardnumber.text = "";
    aadharcardnumber.text = "";
    usercontact.text = "";
    parent_guardian_number.text = "";
    current_address.text = "";
    permanent_address.text = "";
    dateinput.text="";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Credential Form"),
          backgroundColor: Colors.purpleAccent,
        ),

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                    controller: first_name,
                    decoration: InputDecoration(
                      labelText: "First name",
                      prefixIcon: Icon(Icons.people),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                TextField(
                    controller: last_name,
                    decoration: InputDecoration(
                      labelText: "Last name",
                      prefixIcon: Icon(Icons.people),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                Text("Gender", style: TextStyle(
                    fontSize: 20
                ),),
                RadioListTile(
                  title: Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),

                RadioListTile(
                  title: Text("Female"),
                  value: "female",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Other"),
                  value: "other",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                TextField(
                  controller: dateinput,
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText: "Enter Date"
                  ),
                  readOnly: true,
                  onTap: () async {
                    Future<DateTime?> pickedDate = showDatePicker(
                        context: context, initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101)
                    );
                    if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate as DateTime);
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text = formattedDate; //set output date to TextField value.
                      });
                    }else{
                      print("Date is not selected");
                    }
                  },
                ),
                Divider(),
                TextField(
                    controller: father_name,
                    decoration: InputDecoration(
                      labelText: "Father name",
                      prefixIcon: Icon(Icons.people),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                TextField(
                    controller: mother_name,
                    decoration: InputDecoration(
                      labelText: "Mother Name",
                      prefixIcon: Icon(Icons.people),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                Text("Occupation", style: TextStyle(
                    fontSize: 20
                ),),

                Divider(),
                RadioListTile(
                  title: Text("Education"),
                  value: "education",
                  groupValue: occupation,
                  onChanged: (value){
                    setState(() {
                      occupation = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Job"),
                  value: "other",
                  groupValue: occupation,
                  onChanged: (value){
                    setState(() {
                      occupation = value.toString();
                    });
                  },
                ),
                TextField(
                    controller: company_university,
                    decoration: InputDecoration(
                      labelText: "Company/University",
                      prefixIcon: Icon(Icons.people),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                TextField(
                    controller: interest_hobbies,
                    decoration: InputDecoration(
                      labelText: "Interests/Hobbies",
                      prefixIcon: Icon(Icons.people),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                TextField(
                    controller: aadharcardnumber,
                    decoration: InputDecoration(
                      labelText: "Aadhar Card Number",
                      prefixIcon: Icon(Icons.people),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                TextField(
                    controller: pancardnumber,
                    decoration: InputDecoration(
                      labelText: "PAN Card number",
                      prefixIcon: Icon(Icons.message),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                TextField(
                    controller: usercontact,
                    decoration: InputDecoration(
                      labelText: "Contact Number",
                      prefixIcon: Icon(Icons.people),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                TextField(
                    controller: parent_guardian_number,
                    decoration: InputDecoration(
                      labelText: "Parent/Guardian Number",
                      prefixIcon: Icon(Icons.people),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                Text("Smoker", style: TextStyle(
                    fontSize: 20
                ),),

                Divider(),
                RadioListTile(
                  title: Text("Yes"),
                  value: "yes",
                  groupValue: smoker,
                  onChanged: (value){
                    setState(() {
                      smoker = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("No"),
                  value: "no",
                  groupValue: smoker,
                  onChanged: (value){
                    setState(() {
                      smoker = value.toString();
                    });
                  },
                ),
                Text("Do you Drink?", style: TextStyle(
                    fontSize: 20
                ),),

                Divider(),
                RadioListTile(
                  title: Text("Yes"),
                  value: "yes",
                  groupValue: drink,
                  onChanged: (value){
                    setState(() {
                      drink = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("No"),
                  value: "no",
                  groupValue: drink,
                  onChanged: (value){
                    setState(() {
                      drink = value.toString();
                    });
                  },
                ),
                TextField(
                    controller: current_address,
                    decoration: InputDecoration(
                      labelText: "Current Address",
                      prefixIcon: Icon(Icons.pin),
                      border: myinputborder(),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    )
                ),
                TextField(
                    controller: permanent_address,
                    decoration: InputDecoration(
                      labelText: "Permanent Address",
                      prefixIcon: Icon(Icons.pin),
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