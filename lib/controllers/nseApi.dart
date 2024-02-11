import 'package:dio/dio.dart';

class NseApi {
  static final dio = Dio();

  static Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      List<Map<String, dynamic>> dataList = [];

      Response response = await dio.get(
          'https://www.nseindia.com/api/option-chain-indices?symbol=NIFTY');
      Map<String, dynamic> parsedJson = response.data;

      // Extract the required fields
      List<dynamic> records = parsedJson['records']['data'];
      for (var data in records) {
        // Check if both 'PE' and 'CE' are present
        if (data['PE'] != null && data['CE'] != null) {
          // Extract 'PE' and 'CE' data
          Map<String, dynamic> peData = data['PE'];
          Map<String, dynamic> ceData = data['CE'];

          // Create entries for 'PE' and 'CE'
          Map<String, dynamic> peEntry = {
            'strikePrice': data['strikePrice'],
            'changeInOpenInterest_PE': peData['changeinOpenInterest'],
            'expiryDate': data['expiryDate']
          };

          Map<String, dynamic> ceEntry = {
            'strikePrice': data['strikePrice'],
            'changeInOpenInterest_CE': ceData['changeinOpenInterest'],
            'expiryDate': data['expiryDate']
          };

          // Add 'PE' and 'CE' entries to the dataList
          dataList.add(peEntry);
          dataList.add(ceEntry);
        }
      }

      return dataList;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}
