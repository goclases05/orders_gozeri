import 'package:app_orders/models/productos_departamento.dart';
import 'package:flutter/material.dart';


class ArticleHorizontal extends StatelessWidget {
  const ArticleHorizontal({
    Key? key,required this.list_Prod,
  }) : super(key: key);

  final Producto list_Prod;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin:const EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Stack(
            children:[
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(list_Prod.url+list_Prod.foto,width: 100),

                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                          Text(list_Prod.producto,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              fontSize: 18
                            ),
                          ),
                          Text(list_Prod.descBreve,
                            maxLines: 3,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black45
                            ),
                          ),
                          Text(list_Prod.precio,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 4, 146, 165)
                            ),
                          ),
                           const SizedBox(height: 10,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              /*Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding:const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape:BoxShape.circle,
                  ),
                  child:const Icon(Icons.favorite,
                    color: Colors.red,
                  ),
                )
              )*/
            ]
          ),
          const Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.only(right: 10,bottom: 10,top: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan.shade700,
                    padding:const EdgeInsets.all(5),
                  ),
                  onPressed: () {
                      // Respond to button press
                  },
                  child:const Text('  Ver Detalles  ',style: TextStyle(
                    color: Colors.white
                  ),),
                ),
                const SizedBox(width: 5,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow.shade800,
                    padding:const EdgeInsets.all(5),
                  ),
                  onPressed: () {
                      // Respond to button press
                  },
                  child:const Text('Agregar al Carrito',style: TextStyle(
                    color: Colors.white
                  ),),
                )
              ],
            ),
          )
          
        ],
      ),

    );
  }
}