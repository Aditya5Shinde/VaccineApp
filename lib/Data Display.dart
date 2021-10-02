import 'package:flutter/material.dart';
import 'CenterToAll.dart';


class Centres extends StatefulWidget {
  Centres({this.vaccData , this.eroor });
  final vaccData;
  final eroor;


  @override
  _CentresState createState() => _CentresState();
}

class _CentresState extends State<Centres> {

   // List <GestureDetector> gestureDetector = [];
   // List <GestureDetector> gestureDetector1 = [];


 List <String> Centername = [];
 int i= 0;


// List <GestureDetector> Add(dynamic VaccineData , dynamic eroor) {
//   print('i se phele');
//   if(VaccineData['centers'].isNotEmpty && widget.eroor==200){
//     for(i=0 ; i<VaccineData['centers'].length ; i++) {
//       print('Gesture widget');
//       print(i);
//       index = i;
//       gestureDetector.add(GestureDetector(
//         onTap: (){
//           print(index);
//           Navigator.push(context, MaterialPageRoute(builder: (context) =>
//               Display(vaccData: widget.vaccData , eroor: widget.eroor , no: index,)));
//           },
//         child:Card(
//           elevation: 10.0,
//           child: Text('Center Name:- ${Centername[i]}', style: TextStyle(
//             color: Colors.red,
//             fontSize: 24.0,
//           ),),
//           color: Colors.blue,
//           shadowColor: Colors.black,
//         ),
//       ));
//     }
//   }
//   else{
//     gestureDetector.add(GestureDetector(
//      child: Card(
//        child: Text('Sorry no center Available', style: TextStyle(
//          color: Colors.amberAccent,
//          fontSize: 24.0,
//        ),),
//        color: Colors.black,
//        shadowColor: Colors.white,
//      ),
//     ),
//     );
//   }
//    return gestureDetector;
//  }


  void updateUi(dynamic VaccineData , dynamic eroor) {
    if(widget.eroor == 200 ){
      //center = VaccineData['centers'];
      // print(VaccineData['centers']);
      print('Upper');
      if ( VaccineData['centers'].isEmpty){
        setState(() {
          print('Error');
          print(VaccineData['centers']);
          for( i ; i<VaccineData['centers'].length ; i++ ) {
            Centername[i] = 'Enable To Fetch';
          }

        });
      }
      else {
        setState(() {
          print('CenterName');
          print(VaccineData['centers'].length);
          for(i=0 ; i<VaccineData['centers'].length; i++ ) {
            print('Got center names');
            Centername.add(VaccineData['centers'][i]['name']);
            print('Got center names');
          }
        });
      }
    }
    else {
      setState(() {
        for( i=0 ;i<VaccineData['centers'].length; i++ ) {
          Centername[i] = 'Enable To Fetch';
        }
      });
    }
  }

  @override
  void initState() {
    updateUi(widget.vaccData, widget.eroor);
    // gestureDetector1 = Add(widget.vaccData , widget.eroor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pinkAccent,
       body: ListView.builder(
           itemCount:widget.vaccData['centers'].length != 0 ?widget.vaccData['centers'].length: 1,
           itemBuilder: (context , index) {
             return Center(
               child: Card(
                 elevation: 10.0,
                 color: Colors.teal,
                 shadowColor: Colors.amberAccent,
                 child: ListTile(
                   onTap: (){
                     print(index);
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>
                         Display(vaccData: widget.vaccData , eroor: widget.eroor , no: index,)));
                   },
                   title: Center(child: widget.vaccData['centers'].length != 0? Text(Centername[index] ,
                   style: TextStyle(
                     color: Colors.deepPurple,
                     fontSize: 18,
                   )
                   ):Text("Sorry No Center Available" ,
                       style: TextStyle(
                         color: Colors.deepPurple,
                         fontSize: 18,
                       )
                   ) ,
                   ),
                 ),
               ),
             );
           }
       )
      ),
    );
  }
}

// Container(
// height: double.infinity,
// width: double.infinity,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: gestureDetector1,
// ),
// ),

