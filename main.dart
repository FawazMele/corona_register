
import 'package:coronaregister/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('صفحة تسجيل الدخول'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'تطبيق رصد الحالات ',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                SizedBox(
                  height: 30,
                ),

                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(fontSize: 20),
                    )),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'اسم المستخدم',
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'كلمة المرور',
                    ),
                  ),
                ),
//                FlatButton(
//                  onPressed: (){
//                    //forgot password screen
//                  },
//                  textColor: Colors.blue,
//                  child: Text('نسيت كلمة السر ؟'),
//                ),

                SizedBox(
                  height: 50,
                ),

                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('تسجيل الدخول'),

                      onPressed: ()  {
                        if (!nameController.text.isEmpty || !passwordController.text.isEmpty) {

                          Widget okButton = FlatButton(
                            child: Text("موافق"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                              );
                            },
                          );

                          showDialog(context: context, child:
                          new AlertDialog(
                            title: new Text("تم تسجيل الدخول بنجاح"),
                            content: new Text(nameController.text + "  "
                                + "  " + passwordController.text ) ,
                            actions: [
                              okButton
                            ],
                          )
                          );
                        }
                      },
                    )),
              ],
            )));
  }
}
 