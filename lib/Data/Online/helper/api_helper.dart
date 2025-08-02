import 'dart:io';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<dynamic> getApi({required String url}) async {
    String authKey = "HuieUshJkwM4HmRbzixTAj8TPpuxD3npz442tslVjWHlkne4jLBotquH";
    try {
      final response = await http.get(
          headers: {"Authorization": authKey}, Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      }
      else if (response.statusCode == 404) {
        throw Exception("Not Found 404");
      }
      else if (response.statusCode == 500) {
        throw Exception("Internal Server Error");
      }
      else {
        throw Exception("Error:${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No Internet connection..");
    } on HttpException {
      throw Exception("Could not find the ");
    }
    catch (e) {}
  }
}