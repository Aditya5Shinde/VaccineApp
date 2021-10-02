
class Const{
final List <String>dayNo = [];
final List <String>monthNo = [];

 void dayadd(){
   for(int i= 01 ; i<=31 ; i++ ){
     dayNo.add(i.toString().padLeft(2,'0'));
   }
 }
void monthadd(){
  for(int i= 01 ; i<=12; i++ ){
    monthNo.add(i.toString().padLeft(2,'0'));
  }
}
}