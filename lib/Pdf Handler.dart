// // ignore: import_of_legacy_library_into_null_safe
// import 'package:http/http.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:pdf_flutter/pdf_flutter.dart';
//
// class pdf_handler{
//
//   pdf_handler({required this.refeId});
//  // final Url = Uri.parse('https://cdn-api.co-vin.in/api/v2/registration/certificate/public/download?beneficiary_reference_id=1234567890123');
//  late String refeId;
//  Future getPdf () async{
//    try{
//      Response response = await get(Uri.parse('https://cdn-api.co-vin.in/api/v2/registration/certificate/public/download?beneficiary_reference_id=1234567890123'));
//      if(response.statusCode == 200){
//        return PDF.network('https://cdn-api.co-vin.in/api/v2/registration/certificate/public/download?beneficiary_reference_id=$refeId');
//      }
//      else
//        return response.statusCode;
//    }
//
//    catch(e){
//      print(e);
//    }
//  }
//
//
//
//
// }