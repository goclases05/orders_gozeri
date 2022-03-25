import 'package:app_orders/models/productos_departamento.dart';
import 'package:flutter/material.dart';

class SimpleArticle extends StatelessWidget {
  const SimpleArticle({ Key? key,required this.list_Prod }) : super(key: key);

  final Producto list_Prod;
  
  @override
  Widget build(BuildContext context) {
    const productHeight=110.0;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          elevation: 6,
          shadowColor: Colors.black54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(list_Prod.url+list_Prod.foto,width: 100),

                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(list_Prod.producto,style:const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(list_Prod.descComp,style:const TextStyle(
                          color: Colors.black54,
                          fontSize: 10,
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 5,),
                      Text(list_Prod.precio,style:const TextStyle(
                          color: Color.fromARGB(255, 4, 167, 189),
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                        
                      ),
                      IconButton(
                        onPressed: (){}, 
                        icon:const  CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 4, 167, 189),
                          radius: 18,
                          child: Icon(
                            Icons.add,
                            size: 25,
                            color: Color.fromARGB(255, 207, 216, 220),
                          )
                        )
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}