import 'dart:convert';
import 'package:http/http.dart' as http;

var host='http://172.16.12.43:3000';

Future<List<dynamic>> getTable(String tableName) async {
  final response = await http.get(Uri.parse('$host/$tableName'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}
Future<List<dynamic>> getItemByID(String tableName,int id) async {
  final response = await http.get(Uri.parse('$host/$tableName/$id'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}