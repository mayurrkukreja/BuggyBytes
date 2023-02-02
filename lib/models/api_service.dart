import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:rentmate/models/login_response.dart';
import 'package:rentmate/models/register_response.dart';

// import 'config.dart';

class APIService {
  static var client = http.Client();
  String baseurl = "http://localhost:5000";
  FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<LoginResponseModel> otpLogin(String mobileNo) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.parse('http:/192.168.28.37:5000/users/otpLogin');

    // var url = Uri.http(apiURL, Config.otpLoginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"phone": mobileNo}),
    );

    return loginResponseJson(response.body);
  }

  static Future<LoginResponseModel> verifyOtp(
    String mobileNo,
    String otpHash,
    String otpCode,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('http://192.168.28.37:5000/users/verifyOTP');
    // var url = Uri.http(Config.apiURL, Config.verifyOTPAPI);
    // add ip address and uncomment above code to run on localhost
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"phone": mobileNo, "otp": otpCode, "hash": otpHash}),
    );

    return loginResponseJson(response.body);
  }
  // static Future<SignupResponseModel> register()

  // register response model
  static Future<RegisterResponseModel> register(
    String firstName,
    String lastName,
    String email,
    String city,
    // String gender,
    // String dateOfBirth
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.parse('http://192.168.28.37:5000/users/register');
    // var apiURL = Uri.parse('https://prodeti-api.herokuapp.com');
    // var url = Uri.http(apiURL, Config.otpLoginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "firstname": firstName,
        "lastname": lastName,
        "email": email,
        "city": city,
        // "gender": gender,
        // "dateofbirth": dateOfBirth
      }),
    );
    print(response.body);
    return registerResponseJson(response.body);
  }

  Future<http.Response> post(Map<String, String> body) async {
    String? token = await storage.read(key: "token");
    // url = formater(url);
    // log.d(body);
    var url = Uri.parse('http://192.168.28.37/profile/add');
    var response = await http.post(
      url,
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> patch(String url, Map<String, String> body) async {
    // String token = await storage.read(key: "token");
    // url = formatter(url);
    // log.d(body);
    var url = Uri.parse('http://192.168.28.37:5000/profile/add/image');
    var response = await http.patch(
      url,
      headers: {
        "Content-type": "application/json"
        // "Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

/* 
  EDIT Profile Integration and Unit Testing
*/

  // String baseurl = "http://localhost:5000";
  NetworkImage getImage(String imageName) {
    String url = (baseurl + "/uploads//$imageName.jpg");
    return NetworkImage(url);
  }

  Future<http.StreamedResponse> postImage(String filePath) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("http://192.168.28.37:5000/uploadpicture"));
    request.files.add(await http.MultipartFile.fromPath("img", filePath));
    request.headers.addAll({"Content-type": "multipart/form-data"});
    var response = request.send();
    return response;
  }

  static Future<RegisterResponseModel> mainprofile(
    String firstName,
    String lastName,
    String email,
    String city,
    // String gender,
    // String dateOfBirth
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.parse('https://192.168.28.37/users/register');
    // var apiURL = Uri.parse('https://prodeti-api.herokuapp.com');
    // var url = Uri.http(apiURL, Config.otpLoginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "firstname": firstName,
        "lastname": lastName,
        "email": email,
        "city": city,
        // "gender": gender,
        // "dateofbirth": dateOfBirth
      }),
    );
    print(response.body);
    return registerResponseJson(response.body);
  }
}
