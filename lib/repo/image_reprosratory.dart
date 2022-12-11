import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../modal/image_model.dart';

class Imagereposratory {
  Future<List<pixelforimage>> getNetworkImages() async {
    try {
      var endpointUrl = Uri.parse('http://pixelford.com/api2/images');
      final response = await http.get(endpointUrl);

      if (response.statusCode == 200) {
        final List<dynamic> decodedList = jsonDecode(response.body) as List;

        final List<pixelforimage> _imagelist = decodedList.map((listItem) {
          return pixelforimage.fromJson(listItem);
        }).toList();

        print(_imagelist[0].urlFullSize);
        return _imagelist;
      } else {
        throw Exception('API not successful!');
      }
    } on SocketException {
      throw Exception("No Internet Connection :(");
    } on HttpException {
      throw Exception("Couldnt retrieve the image! Sorry!");
    } on FormatException {
      throw Exception("Bad response format!");
    } catch (e) {
      print(e);
      throw Exception("Unknown error");
    }
  }
}
