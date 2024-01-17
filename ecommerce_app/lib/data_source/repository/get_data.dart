import 'dart:convert';
import 'package:http/http.dart' as http;

var host = 'https://c3cd-2001-ee0-2f1-c255-d053-e33-bfa7-dcb.ngrok-free.app';

Future<List<dynamic>> getTable(String tableName) async {
  final response = await http.get(Uri.parse('$host/$tableName'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<dynamic>> getItemByID(String tableName, int id) async {
  final response = await http.get(Uri.parse('$host/$tableName/$id'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}
