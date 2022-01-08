// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

String baseUrl = 'https://isro.vercel.app/api/';

Future<dynamic> getSpaceCrafts() async {
  try {
    final response = await http.get(Uri.parse('${baseUrl}spacecrafts'));
    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      return res['spacecrafts'];
    } else {
      print(response.body);
    }
  } catch (e) {
    print(e);
  }
  return [];
}

Future<dynamic> getLaunchers() async {
  try {
    final response = await http.get(Uri.parse('${baseUrl}launchers'));
    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      return res['launchers'];
    } else {
      print(response.body);
    }
  } catch (e) {
    print(e);
  }
  return [];
}

Future<dynamic> getCustomerSatellites() async {
  try {
    final response = await http.get(Uri.parse('${baseUrl}customer_satellites'));
    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      return res['customer_satellites'];
    } else {
      print(response.body);
    }
  } catch (e) {
    print(e);
  }
  return [];
}

Future<dynamic> getCentres() async {
  try {
    final response = await http.get(Uri.parse('${baseUrl}centres'));
    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      return res['centres'];
    } else {
      print(response.body);
    }
  } catch (e) {
    print(e);
  }
  return [];
}
