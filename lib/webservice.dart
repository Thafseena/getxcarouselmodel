import 'package:getxcarouselmodel/carouselmodel.dart';
import 'package:http/http.dart' as http;

class ApiRepositoryImpl {
  
  static var client = http.Client();
String bannerimg='http://192.168.43.85:8080/lmswebapplication/banners/';


 
// static Future<List<Carouselmodel>?> getCarousel() async {
//   print("ghddddd");
//     var response = await client
//         .post(Uri.parse('http://192.168.29.85:8080/lmswebapplication/banners.jsp'));
//     if (response.statusCode == 200) {
//       var jsonString = response.body;
//       return carouselFromJson(jsonString);
//     } else {
//       //show error message
//       return null;
//     }
//   }
 static Future<List<Carouselmodel>?> getCarousel() async {
  print("111111111111111111 in url");
    var result = await http.get(Uri.parse('http://192.168.43.85:8080/lmswebapplication/banners.jsp'));
        //body: {"category_name": "$categoryName"});
    if (result.statusCode == 200) {

      print("5555555555555555===="+result.body.toString());
      var jsonData = result.body;

      print('CategoryProducts call');

      return carouselFromJson(jsonData);
    } else {
      return null;
    }
  }
static Uri getMainUrl(String endpoind,

      {
        String baseUrl = 'http://192.168.43.85:8080/lmswebapplication/'
        }) {
    var url = Uri.https('${(baseUrl)}', '${(endpoind)}', {'q': '{https}'});
    return url;
  }
}