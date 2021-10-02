import 'package:flutter/material.dart';
import 'QueryHelp.dart';
import 'datapage.dart';


class LoadingPage extends StatefulWidget {


  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

 var image;
  Future <void> Fakedata() async{
    Network network = new Network(pinCode: '500004' , daTe: '3-03-2021');
    var data = await network.getInfo();
    Navigator.push(context, MaterialPageRoute(builder: (context) => vaccine()));
  }

  @override
  void initState() {
    Fakedata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/vaccine.png'),

              )
            ),
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
