import 'dart:convert';
import 'package:app/src/overrides.dart';
import 'package:http/http.dart' as httpClient;
import 'db_service_response.model.dart';

class DbServices {
  getapi(api, {headers, isMockAPI}) async {
    try {
      final response =
          await httpClient.get(Uri.parse('${Overrides.API_BASE_URL}$api'),
              headers: headers != null
                  ? headers
                  : {
                      'Content-Type': 'application/json',
                    });
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return ResponseModel(statusCode: response.statusCode, data: data);
      } else {
        return ResponseModel(statusCode: response.statusCode, data: null);
      }
    } catch (e) {
      if (e.toString().contains('Failed host lookup')) {
        throw ('NO_CONNECTION');
      } else {
        throw (e);
      }
    }
  }
}
