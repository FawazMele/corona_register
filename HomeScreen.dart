import 'package:coronaregister/addNewCase.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController buildingNumberController = TextEditingController();
  TextEditingController BuildingGuardController = TextEditingController();

  List<Selection> buildingType = <Selection>[
    const Selection('فيلا'),
    const Selection(' عمارة'),
    const Selection(' مجمع سكني'),
    const Selection(' ملحق')
  ];
  List<Selection> districts = <Selection>[
    const Selection('ينبع'),
    const Selection('العلا'),
    const Selection('الحناكية'),
    const Selection('المدينة')
  ];

  Selection selectedBuilding;
  Selection selectedDistrict;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('تسجيل بيانات المبنى'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'تسجيل بيانات المبنى',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 15, 24, 0),
                  child: TextField(
                  controller: buildingNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'رقم المبنى',
                    ),
                      keyboardType: TextInputType.number
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 15, 24, 0),
                  child: TextField(
                    controller: BuildingGuardController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'رقم حارس المبنى ان وجد',
                    ),
                      keyboardType: TextInputType.number
                  ),
                ),
                Wrap(children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
                    child: DropdownButton<Selection>(
                      hint: new Text("نوع المبنى"),
                      value: selectedBuilding,
                      onChanged: (Selection newValue) {
                        setState(() {
                          selectedBuilding = newValue;
                        });
                      },
                      items: buildingType.map((Selection user) {
                        return new DropdownMenuItem<Selection>(
                          value: user,
                          child: new Text(
                            user.name,
                            style: new TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
                    child: DropdownButton<Selection>(
                      hint: new Text(" المحافظة"),
                      value: selectedDistrict,
                      onChanged: (Selection newValue) {
                        setState(() {
                          selectedDistrict = newValue;
                        });
                      },
                      items: districts.map((Selection user) {
                        return new DropdownMenuItem<Selection>(
                          value: user,
                          child: new Text(
                            user.name,
                            style: new TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ]),
                SizedBox(height: 40),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text(' التالي '),
                        onPressed: () async {
                          Position position = await Geolocator()
                              .getCurrentPosition(
                                  desiredAccuracy: LocationAccuracy.high);

//                          Navigator.push(
//                            context,
//                            new MaterialPageRoute(builder: (context) => new addNewCase(value: "Value")),
//                          );
                          var route = new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new addNewCase(location: position.toString()),
                          );
                          Navigator.of(context).push(route);
                        })),
              ],
            )));
  }
}
