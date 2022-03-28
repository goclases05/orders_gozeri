import 'package:app_orders/models/productos_departamento.dart';
import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/material.dart';

class DetailsArticle extends StatefulWidget {
  final Producto list_Prod;
  DetailsArticle({ Key? key,required this.list_Prod }) : super(key: key);
  int _counterValue = 1;

  @override
  State<DetailsArticle> createState() => _DetailsArticleState();
}

class _DetailsArticleState extends State<DetailsArticle> {
  /*
  Hero(
        tag: 'List_${list_Prod.idProd}',
        child: Image.network(
          list_Prod.url+list_Prod.foto,
          fit: BoxFit.cover,
        ),
      ),
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Hero(
                        tag: 'List_${widget.list_Prod.idProd}',
                        child: Image.network(
                          widget.list_Prod.url+widget.list_Prod.foto,
                          //fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height*0.3,
                        ),
                      ),
                    ),
                    Text(widget.list_Prod.producto,style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(123, 0, 0, 0)
                      ),
                    ),
                    const SizedBox(height: 5,),
                     Text(widget.list_Prod.codigo,style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[200]
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding:const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: CountStepper(
                            iconDecrement: Icon(Icons.remove,color:Colors.cyan[700],),
                            iconIncrement: Icon(Icons.add,color: Colors.cyan[700],),
                            iconColor: Colors.cyan[700],
                            defaultValue: widget._counterValue,
                            max: 10,
                            min: 1,
                            iconDecrementColor: Colors.cyan[700],
                            splashRadius: 25,
                            onPressed: (value) {
                              setState(() {
                                widget._counterValue=value;
                              });
                            },
                          ),
                        ),
                        Spacer(),
                        Text('Q '+widget.list_Prod.precio,style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25,),
                    Text('Nostrud laboris do Lorem pariatur culpa veniam minim pariatur deserunt.Ullamco irure labore sunt pariatur velit. Laborum consequat elit incididunt aliqua. Lorem exercitation ad id tempor dolor aute laborum qui eu anim tempor elit nisi. Enim esse eiusmod quis qui non. In excepteur mollit eiusmod labore velit laboris in sit irure fugiat Lorem eiusmod aliquip. Mollit duis veniam voluptate eu aute nisi laborum minim pariatur aliquip eiusmod.',style: Theme.of(context).textTheme.subtitle1)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  flex:1,
                  child: GestureDetector(
                  child: Container(
                    margin:const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      //color: Theme.of(context).primaryColor,
                      color: Colors.cyan[800],
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child:const Icon(Icons.shopping_cart_outlined,color: Colors.white, size: 25,) ,
                  ),
                ),
                ),
                Expanded(
                  flex: 5,
                  child: RaisedButton(
                    color: Colors.cyan,
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child:const Padding(
                      padding:  EdgeInsets.symmetric(vertical: 15.0),
                      child:  Text('Agregar al Carro',style:TextStyle(
                        color: Colors.white
                      )),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}