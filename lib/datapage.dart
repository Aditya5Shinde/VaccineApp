import 'package:flutter/material.dart';
import 'QueryHelp.dart';
import 'Data Display.dart';
import 'Constant.dart';
// import 'Pdf Handler.dart';
// import 'package:vaccine/Pdfview.dart';

class vaccine extends StatefulWidget {
  @override
  _vaccineState createState() => _vaccineState();
}

class _vaccineState extends State<vaccine> {
  bool pvalue = false;
  bool dvalue = false;
 String refrenceId = '12344';
  String date = 'dd-MM-yy';
  String pin = '123456';
  String HDate = '29-05-2021';
  String Hpin = '490001';
  String HRefe = '1234657891023';
  bool checkdate = false;
  Const Konst = new Const();
  final fieldtext = TextEditingController();
  void clearText() {
    fieldtext.clear();
  }

  final fieldtext1 = TextEditingController();
  void clearText1() {
    fieldtext1.clear();
  }
  final fieldtext2 = TextEditingController();
  void clearText2() {
    fieldtext.clear();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Know Slot Availability',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          pvalue = true;
                        });
                      },
                      child: pvalue == false
                          ? Container(
                              height: 75.0,
                              width: 125.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                color: Colors.brown,
                              ),
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(10.0),
                              child: Center(child: Text('Pin code')),
                            )
                          : Container(
                              height: 75.0,
                              width: 145.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                color: Colors.deepOrangeAccent,
                              ),
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(10.0),
                              child: Center(
                                child: TextField(
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    pin = value;
                                    print(pin.length);
                                    print(pin);
                                  },
                                  decoration: InputDecoration(
                                    hintText: Hpin,
                                  ),
                                  controller: fieldtext,
                                ),
                              ),
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          dvalue = true;
                        });
                      },
                      child: dvalue == false
                          ? Container(
                              height: 75.0,
                              width: 125.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                color: Colors.brown,
                              ),
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(10.0),
                              child: Center(child: Text('Date')),
                            )
                          : Container(
                              height: 75.0,
                              width: 145.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                color: Colors.deepOrangeAccent,
                              ),
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(10.0),
                              child: Center(
                                child: TextField(
                                  keyboardType: TextInputType.datetime,
                                  textAlign: TextAlign.center,
                                  autofocus: true,
                                  onChanged: (value) {
                                    date = value;
                                    print(date.length);
                                    print(date);
                                  },
                                  decoration: InputDecoration(
                                    hintText: HDate,
                                  ),
                                  controller: fieldtext1,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (date.length != 10 || pin.length != 6) {
                      print('Execute Clear');
                      clearText();
                      clearText1();
                      setState(() {
                        HDate = 'Re Enter the date';
                        Hpin = 'Re Enter the Pin';
                      });
                    } else {
                      Konst.dayadd();
                      Konst.monthadd();
                      String month = date[3] + date[4];
                      String day = date[0] + date[1];
                      for (int i = 0; i <= 11; i++) {
                        if (month == Konst.monthNo[i]) {
                          print('Passed');
                          print(i);
                          for (int j = 0; j <= 30; j++) {
                            if (day == Konst.dayNo[j]) {
                              print('Passed');
                              print(j);
                              print('break1');
                              checkdate = true;
                              break;
                            }
                          }
                          print('break2');
                          break;
                        }
                        print('hello');
                      }

                      if (checkdate == true) {
                        checkdate = false;
                        print('Getting Data');
                        Network Fetch = new Network(pinCode: pin, daTe: date);
                        var vacData = await Fetch.getInfo();
                        var eroor = await Fetch.geteroor();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Centres(vaccData: vacData, eroor: eroor)));
                      } else {
                        print('Execute Clear');
                        clearText();
                        clearText1();
                        setState(() {
                          HDate = 'Re Enter the date';
                          Hpin = 'Re Enter the Pin';
                        });
                      }
                    }
                  },
                  child: Icon(Icons.youtube_searched_for),
                ),
                // Center(
                //   child: GestureDetector(
                //     onTap: () {
                //       setState(() {
                //         pvalue = true;
                //       });
                //     },
                //     child: pvalue == false
                //         ? Container(
                //             height: 75.0,
                //             width: 125.0,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.all(Radius.circular(40)),
                //               color: Colors.brown,
                //             ),
                //             margin: EdgeInsets.all(10.0),
                //             padding: EdgeInsets.all(10.0),
                //             child: Center(child: Text('Refrence ID')),
                //           )
                //         : Container(
                //             height: 75.0,
                //             width: 145.0,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.all(Radius.circular(40)),
                //               color: Colors.deepOrangeAccent,
                //             ),
                //             margin: EdgeInsets.all(10.0),
                //             padding: EdgeInsets.all(10.0),
                //             child: Center(
                //               child: TextField(
                //                 autofocus: true,
                //                 keyboardType: TextInputType.number,
                //                 textAlign: TextAlign.center,
                //                 onChanged: (value) {
                //                   refrenceId = value;
                //                   print(refrenceId.length);
                //                   print(refrenceId);
                //                 },
                //                 decoration: InputDecoration(
                //                   hintText: HRefe,
                //                 ),
                //                 controller: fieldtext2,
                //               ),
                //             ),
                //           ),
                //   ),
                // ),
                // ElevatedButton(
                //   onPressed: () async {
                //     if ( refrenceId.length != 13) {
                //       print('Execute Clear');
                //       clearText2();
                //       setState(() {
                //         HRefe = 'Re Enter Refrence id';
                //       });
                //     } else {
                //       pdf_handler Pdf = new pdf_handler(refeId: refrenceId);
                //       var Bpdf = Pdf.getPdf();
                //       Navigator.push(context, MaterialPageRoute(builder: (context)=>
                //        PdfView(Bpdf: Bpdf)
                //       ));
                //     }
                //   },
                //     child: Icon(Icons.download),
                // ),
              ],
            ),
          ),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
