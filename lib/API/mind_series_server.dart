//import 'package:ruki_console/Config/ApiKeys.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_keys.dart';

class MindSeriesServer{
  @override
  Future<bool> request({entry}) async {
    var data = {};
    try {
      final result = await http.post(
        Uri.parse("${APIKeys.serverUrl}/sendTwilioSMSVerification"),
        body: jsonEncode(<String, String>{"phoneNumber": entry as String}),
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*'
        },
      );

      if (result.statusCode < 200 || result.statusCode > 300) {
        return false;
      } else {
        data = json.decode(result.body);
      }
    } catch (e) {
      throw e;
    }

    return data["success"];
  }

  @override
  Future<bool> validate({entry, code}) async {
    var data = {};
    try {
      final result = await http.post(
        Uri.parse("${APIKeys.serverUrl}/verifyTwilioSMSCode"),
        body: jsonEncode(
            <String, String>{"phoneNumber": entry as String, "code": code}),
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*'
        },
      );

      if (result.statusCode < 200 || result.statusCode > 300) {
        return false;
      } else {
        data = json.decode(result.body);
      }
    } catch (e) {
      throw e;
    }
    if (data["data"]["valid"] == null) {
      return false;
    } else {
      return data["data"]["valid"];
    }
  }
}
