import 'package:app_orders/widget/widget.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class ListOrders extends StatelessWidget {
  const ListOrders({
    Key? key,
    required this.primary,
    required this.secondary,
    required this.height,
    required this.whith,
  }) : super(key: key);

  final Color? primary;
  final Color? secondary;
  final double height;
  final double whith;
  

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: primary,
        title: Row(
          children: [
            const SizedBox(width: 15,),
            Image.asset(
              'assets/logos/gozeri_green.png',
              width: 100,
            ),
          ],
        ),
        actions: [
          const SizedBox(width: 10,),
          IconButton(
            onPressed: (){}, 
            icon:Badge(
              badgeContent: const Text(
                '9',
                style: TextStyle(color: Colors.white),
              ),
              child: const Icon(Icons.notifications_sharp,color: Colors.white,size: 30,),
              badgeColor: Colors.orange.shade900,
              //position: BadgePosition.topEnd(),
              animationType: BadgeAnimationType.scale,
              //animationDuration: Duration(milliseconds: 250),
            ),
          ),
          const SizedBox(width: 15,),
          const DropPerfil(),
          const SizedBox(width: 15,),
        ],
      ),
      body: Container(
          margin: EdgeInsets.only(top: height * 0.1), 
          child: Column(
            children:[
              Padding(
               padding: const EdgeInsets.only(top:40,left: 20,right: 20,bottom: 20),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children:const [
                   Text("Lista de Pedidos",style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(123, 0, 0, 0)
                    ),
                  ),
                   Text("Registro pedidos en proceso pendientes de terminar",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(123, 0, 0, 0)
                    ),
                  ),
                 ],
               ),
             ),
              Expanded(
               child: ListView.builder(
                 physics: const BouncingScrollPhysics(),
                 itemCount: 10,
                 itemBuilder: (context,index){
                   return TicketView(primary);
                 }
                )
              )
            ],
          )
      ),
    );
  }
}
