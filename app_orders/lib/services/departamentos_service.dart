import 'dart:convert';

import 'package:app_orders/global/global.dart';
import 'package:app_orders/models/departamentos_model.dart';
import 'package:http/http.dart' as http;

class DepartamentosService {
  final String _baseUrl = Environment.apiUrl;

  Future getDepartamentos() async {
    final Map<String, dynamic> data = {
      'empresa': '13',
    };
    final url = Uri.https(_baseUrl, '/flutter_gozeri/departamentos.php');

    final resp = await http.post(url, body: data);

    if (resp.statusCode == 200) {
      // If the server did return a 200 OK response,
      // hen parse the JSON.
      //final response = Departamentos.fromJson(resp.body);
      final response = departamentosFromJson(resp.body);
      //print(response.resultsDepartamentos);
      return response;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Fallo en petición');
    }
  }
}

class Category {
  String id;
  String title;

  Category({
    required this.id,
    required this.title,
  });

  static Future<List<Category>> getCategories() async {
    final Uri uri = Uri.parse(
        "https://app.gozeri.com/flutter_gozeri/departamentos.php?empresa=13");
    final response = await http.get(uri);

    List<Category> list = [];

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);
        for (var map in map['departamentos']) {
          list.add(Category(id: map['ID'], title: map['DEPARTAMENTO']));
        }
      }
    } catch (e, _) {
      print(e.toString());
    }
    return list;
  }
}
