// To parse this JSON data, do
//
//     final departamentos = departamentosFromMap(jsonString);

import 'dart:convert';

class Departamentos {
    Departamentos({
      required  this.totalDepa,
      required  this.departamentos,
    });

    String totalDepa;
    List<Departamento> departamentos;

    factory Departamentos.fromJson(String str) => Departamentos.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Departamentos.fromMap(Map<String, dynamic> json) => Departamentos(
        totalDepa: json["total_depa"],
        departamentos: List<Departamento>.from(json["departamentos"].map((x) => Departamento.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total_depa": totalDepa,
        "departamentos": List<dynamic>.from(departamentos.map((x) => x.toMap())),
    };
}

class Departamento {
    Departamento({
      required this.id,
      required this.departamento,
    });

    String id;
    String departamento;

    factory Departamento.fromJson(String str) => Departamento.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Departamento.fromMap(Map<String, dynamic> json) => Departamento(
        id: json["ID"],
        departamento: json["DEPARTAMENTO"],
    );

    Map<String, dynamic> toMap() => {
        "ID": id,
        "DEPARTAMENTO": departamento,
    };
}
