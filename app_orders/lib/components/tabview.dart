import 'package:app_orders/global/environment.dart';
import 'package:app_orders/models/productos_departamento.dart';
import 'package:app_orders/widget/article_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

class PageTab extends StatefulWidget {
  
  final String id_depa;
  Color? background_color;
  Color? primary;

  PageTab({ Key? key,required this.id_depa,this.background_color,this.primary}) : super(key: key);

  @override
  State<PageTab> createState() => _PageTabState();
}

class _PageTabState extends State<PageTab> {
  List<Producto> list_producto = [];
  
  
  final RefreshController refreshController =RefreshController(initialRefresh: true);

  Future<bool> getCursosData({bool isRefresh = false}) async {
    final Uri uri = Uri.parse(
        "https://${Environment.apiUrl}/flutter_gozeri/productos_core.php?id_empresa=13&accion=2&id_categoria=${widget.id_depa}&producto=0");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = ProductosDepartamento.fromJson(response.body);
      //print(response.body);
      if (isRefresh) {
        list_producto = result.productos;
      } else {
        list_producto.addAll(result.productos);
      }

      final totalProductos = result.total;

      if (totalProductos == 0) {
        refreshController.loadNoData();
        return false;
      } else {
        setState(() {});
        return true;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: widget.background_color,
          child: SmartRefresher(
            physics: BouncingScrollPhysics(),
            header: WaterDropMaterialHeader(
              color: Colors.white,
              backgroundColor: widget.primary,
            ),
            controller: refreshController,
            enablePullUp: false,
            onRefresh: () async {
              final result = await getCursosData(isRefresh: true);
              if (result) {
                refreshController.refreshCompleted();
              } else {
                refreshController.refreshFailed();
              }
            },
            onLoading: () async {
              final result = await getCursosData();
              if (result) {
                refreshController.loadComplete();
              } else {
                refreshController.loadFailed();
              }
            },
            child: ListView.builder(
              itemCount: list_producto.length,
              itemBuilder: (context, index) {
                final producto = list_producto[index];
        
                return Padding(
                  padding:const EdgeInsets.all(10),
                  child: ArticleHorizontal(list_Prod:producto),
                );
              },
            ),
          ),
        )
    );
  }
}