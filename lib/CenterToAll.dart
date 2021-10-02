import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  Display({this.vaccData , this.eroor , this .no});
  final vaccData;
  final eroor;
  final no;

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  int? centerid;
  String? Centername;
  String? address;
  String? fees;
  int? dose1;
  int? dose2;
  int? minAge;
  String? Vaccname;
  //List? center = [] ;

  void updateUi({dynamic VaccineData , dynamic eroor , int k=0 }) {
    print(k);
    if(widget.eroor == 200 ){
      //center = VaccineData['centers'];
      // print(VaccineData['centers']);
      print('Upper');
      if ( VaccineData['centers'].isEmpty){
        setState(() {
          print('Error Centers is empty');
          print(VaccineData['centers']);
          centerid = 0000 ;
          Centername = 'Enable To Fetch';
          address = 'Enable To Fetch';
          dose1 =  0000;
          dose2 =  0000;
          minAge =  0000;
          Vaccname = 'Enable To Fetch';
          fees = 'Enable To Fetch';
        });
      }
      else {
        setState(() {

          centerid = VaccineData['centers'][k]['center_id'];
          Centername = VaccineData['centers'][k]['name'];
          address = VaccineData['centers'][k]['address'];
          dose1 =
          VaccineData ['centers'][k]['sessions'][0]['available_capacity_dose1'];
          dose2 =
          VaccineData['centers'][k]['sessions'][0]['available_capacity_dose2'];
          minAge = VaccineData ['centers'][k]['sessions'][0]['min_age_limit'];
          Vaccname = VaccineData['centers'][k]['sessions'][0]['vaccine'];
          fees = VaccineData ['centers'][k]['fee_type'];
        });
      }
    }
    else {
      setState(() {
        print('Error Because of server');
        centerid = 0000 ;
        Centername = 'Enable To Fetch';
        address = 'Enable To Fetch';
        dose1 =  0000;
        dose2 =  0000;
        minAge =  0000;
        Vaccname = 'Enable To Fetch';
        fees = 'Enable To Fetch';
      });
    }
  }

  @override
  void initState() {
    updateUi(VaccineData: widget.vaccData ,eroor: widget.eroor  , k: widget.no );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: centerid != null
            ? containers(
            Centername: Centername,
            Vaccname: Vaccname,
            fees: fees,
            dose1: dose1,
            dose2: dose2,
            minAge: minAge,
            address: address
        )
            : Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.brown,
        ),
      ),
    );
  }
}

class containers extends StatelessWidget {
  containers({
    required this.Centername,
    required this.Vaccname,
    required this.fees,
    required this.dose1,
    required this.dose2,
    required this.minAge,
    required this.address,
  });

  final String? Centername;
  final String? address;
  final String? fees;
  final int? dose1;
  final int? dose2;
  final int? minAge;
  final String? Vaccname;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/doctor(2).jpg'),
          fit: BoxFit.cover,
        ),
        color: Colors.cyanAccent,
      ),
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Center Name:- $Centername', style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 24.0,
            ),),
            Text('Center Address:- $address',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 24.0,
              ),),
            Text('Vaccine Fees:- $fees',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 24.0,
              ),),
            Text('Dose 1 Vaccine:-  $dose1',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 24.0,
              ),),
            Text('Dose 2 Vaccine:- $dose2',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 24.0,
              ),),
            Text('Min age:- $minAge',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 24.0,
              ),),
            Text('Name of Vaccine:- $Vaccname',
              style: TextStyle(
                color:Colors.deepPurple,
                fontSize: 24.0,
              ),),
          ],
        ),
      ),

    );
  }
}