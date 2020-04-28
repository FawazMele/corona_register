import 'package:coronaregister/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: addNewCase(),
  ));
}

class Selection {
  const Selection(this.name);

  final String name;
}

class addNewCase extends StatefulWidget {
  final String location;

  addNewCase({Key key, this.location}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<addNewCase> {
  TextEditingController nameController = TextEditingController();
  TextEditingController IDNumberController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController floorNumberController = TextEditingController();
  TextEditingController apartmentNumberController = TextEditingController();

  List<Selection> personState = <Selection>[
    const Selection('سلبي'),
    const Selection('ايجابي')
  ];
  List<Selection> type = <Selection>[
    const Selection('مخالط'),
    const Selection('متعلق بالسفر')
  ];
  List<Selection> gender = <Selection>[
    const Selection('ذكر'),
    const Selection('انثى')
  ];

  Selection selectedDistrict;
  Selection selectedPersonState;
  Selection selectedBuildingState;
  Selection selectedType;
  Selection selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('تسجيل حالة جديدة'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'تسجيل الحالات',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'حالة جديدة ',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 15, 24, 0),
                  child: TextField(
                      controller: floorNumberController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'رقم الطابق / الدور',
                      ),
                      keyboardType: TextInputType.number),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 15, 24, 0),
                  child: TextField(
                      controller: apartmentNumberController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'رقم الشقة ',
                      ),
                      keyboardType: TextInputType.number),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 15, 24, 0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'الاسم',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 15, 24, 0),
                  child: TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'العمر',
                      ),
                      keyboardType: TextInputType.number),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 15, 24, 0),
                  child: TextField(
                    controller: nationalityController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'الجنسية',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 15, 24, 0),
                  child: TextField(
                      controller: IDNumberController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'رقم الهوية / الاقامة',
                      ),
                      keyboardType: TextInputType.number),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 15, 24, 0),
                  child: Wrap(children: <Widget>[
                    DropdownButton<Selection>(
                      hint: new Text(" نوع الحالة"),
                      value: selectedType,
                      onChanged: (Selection newValue) {
                        setState(() {
                          selectedType = newValue;
                        });
                      },
                      items: type.map((Selection user) {
                        return new DropdownMenuItem<Selection>(
                          value: user,
                          child: new Text(
                            user.name,
                            style: new TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                    DropdownButton<Selection>(
                      hint: new Text(" الجنس"),
                      value: selectedGender,
                      onChanged: (Selection newValue) {
                        setState(() {
                          selectedGender = newValue;
                        });
                      },
                      items: gender.map((Selection user) {
                        return new DropdownMenuItem<Selection>(
                          value: user,
                          child: new Text(
                            user.name,
                            style: new TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                    DropdownButton<Selection>(
                      hint: new Text("حالة اصابة المريض"),
                      value: selectedPersonState,
                      onChanged: (Selection newValue) {
                        setState(() {
                          selectedPersonState = newValue;
                        });
                      },
                      items: personState.map((Selection user) {
                        return new DropdownMenuItem<Selection>(
                          value: user,
                          child: new Text(
                            user.name,
                            style: new TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                  ]),
                ),
                Container(
                    height: 70,
                    padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('حفظ بيانات الحالة'),
                      onPressed: () async {
                        Widget okButton = FlatButton(
                          child: Text("موافق"),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new addNewCase()),
                            );
                          },
                        );
                        showDialog(
                            context: context,
                            child: new AlertDialog(
                              title: new Text("تمت اضافة حالة جديدة"),
                              content: new Text(ageController.text +
                                  " " +
                                  apartmentNumberController.text +
                                  " " +
                                  nameController.text +
                                  new Text("${widget.location}").toString()),
                              actions: [
                                okButton,
                              ],
                            ));
                      },
                    )),
                Container(
                    height: 70,
                    padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.red,
                      child: Text('انهاء بيانات المبنى'),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new HomeScreen()),
                        );
                      },
                    )),
                SizedBox(height: 30),
              ],
            )));
  }
}
