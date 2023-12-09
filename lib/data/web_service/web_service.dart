import 'package:http/http.dart' as http;

import '../../constants/constant.dart';
class WebService{
 Future<dynamic> getData()async{
   Uri uri =Uri.parse(apiUrl);
   final response =await http.get(uri);

   return response;
 }
}