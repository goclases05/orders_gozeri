import 'package:app_orders/models/productos_departamento.dart';
import 'package:app_orders/screen/details_article.dart';
import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/material.dart';


class ArticleHorizontal extends StatefulWidget {
  ArticleHorizontal({
    Key? key,required this.list_Prod,required this.primary,required this.secondary
  }) : super(key: key);

  final Producto list_Prod;
  var primary;
  var secondary;
  int _counterValue = 1;

  @override
  State<ArticleHorizontal> createState() => _ArticleHorizontalState();
}

class _ArticleHorizontalState extends State<ArticleHorizontal> {
  
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
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context,animation,__){
                        return FadeTransition(
                          opacity: animation,
                          child:DetailsArticle(
                            list_Prod:widget.list_Prod
                          )
                        );
                      })
                    );
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Hero(
                          tag: 'List_${widget.list_Prod.idProd}',
                          child: Image.network(
                            widget.list_Prod.url+widget.list_Prod.foto,
                            width: 100
                          )
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                            Text(widget.list_Prod.producto,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                fontSize: 18
                              ),
                            ),
                            Text(widget.list_Prod.descBreve,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black45
                              ),
                            ),
                            Text(widget.list_Prod.precio,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 4, 146, 165)
                              ),
                            ),
                             //const SizedBox(height: 10,),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
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
          
          Container(
            padding: const EdgeInsets.only(bottom: 10,right: 10),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 10,),
                Container(
                  padding:const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: CountStepper(
                    iconDecrement: Icon(Icons.remove,color: widget.secondary,),
                    iconIncrement: Icon(Icons.add,color: widget.secondary,),
                    iconColor: widget.secondary,
                    defaultValue: widget._counterValue,
                    max: 10,
                    min: 1,
                    iconDecrementColor: widget.secondary,
                    splashRadius: 25,
                    onPressed: (value) {
                      setState(() {
                        widget._counterValue=value;
                      });
                    },
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin:const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      //color: Theme.of(context).primaryColor,
                      color: widget.primary,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child:const Icon(Icons.add_shopping_cart,color: Colors.white, size: 25,) ,
                  ),
                ),
              ],
            ),
          ),
          /*const Divider(thickness: 1),
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
          )*/
          
        ],
      ),
    
    );
  }
}