import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiController extends GetxController {
  var isLoading = true.obs;
  var data = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    getuser();
  }

  Future<List<dynamic>> getuser() async {
    var response =
        await http.get(Uri.parse("https://randomuser.me/api/?result=10"));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      data.value = jsonResponse['results'];
    } else {
      throw Exception('');
    }
    return data;
  }
}
