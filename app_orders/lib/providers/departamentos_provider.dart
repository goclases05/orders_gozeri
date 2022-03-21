import 'package:http/http.dart' as http;

import 'package:app_orders/global/environment.dart';
import 'package:app_orders/models/departamentos_model.dart';
import 'package:flutter/material.dart';

class DepartamentoProvider extends ChangeNotifier{

  String empresa='13';

  List<Departamento>onDisplayMovie=[];

  DepartamentoProvider(){
    print('movies provider inicializado');

    this.getOnDisplayMovies();
    print('movies provider finalizado');
  }

  getOnDisplayMovies() async{
    var Url=Uri.https(Environment.apiUrl,'/flutter_gozeri/departamentos.php',{
        'empresa': empresa,
      }
    );
    final response =await http.get(Url);
    final nowResponse=Departamentos.fromJson(response.body);

    onDisplayMovie=nowResponse.departamentos;
    //print(onDisplayMovie);
    notifyListeners();
    //final decodeData=json.decode(response.body) as Map<String,dynamic>;

    
  }
}