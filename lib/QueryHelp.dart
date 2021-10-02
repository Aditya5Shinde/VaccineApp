import 'package:http/http.dart';
import 'dart:convert';

class Network {
  late String? pinCode;
  late String? daTe;

  Network({required this.pinCode, required this.daTe});
  Future getInfo() async {
    try {
      Response response = await get(Uri.parse(
          'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=$pinCode&date=$daTe'));
      if (response.statusCode == 200) {
        String information = response.body;
        print(information);
        Map jsonData;
        jsonData = jsonDecode(information);
        return jsonData;
      }
      else {
        return response.statusCode;
      }
    } catch (e) {

      print(e);
    }
  }

  Future geteroor()async{
    try{
      Response response = await get(Uri.parse(
          'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=$pinCode&date=$daTe'));
      return response.statusCode;
    }
    catch (e){
      print(e);
    }
  }


}
