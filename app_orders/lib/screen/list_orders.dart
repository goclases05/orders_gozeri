import 'package:app_orders/widget/widget.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class ListOrders extends StatelessWidget {
  const ListOrders({
    Key? key,
    required this.primary,
    required this.secondary,
    required this.background_color
,
    required this.height,
    required this.whith,
  }) : super(key: key);

  final Color? primary;
  final Color? secondary;
  final double height;
  final double whith;
  final Color?background_color;
  

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: primary,
        title: Row(
          children: [
            const SizedBox(width: 15,),
            Image.asset(
              'assets/logos/gzeri.png',
              width: 100,
            ),
          ],
        ),
        actions: [
          const SizedBox(width: 10,),
          IconButton(
              onPressed: () {},
              icon: Badge(
                badgeContent: const Text(
                  '9',
                  style: TextStyle(color: Colors.white),
                ),
                child: CircleAvatar(
                    backgroundColor: background_color,
                    radius: 18,
                    child: const Icon(
                      Icons.notifications_sharp,
                      size: 25,
                      color: Colors.black54,
                    )),
                badgeColor: Colors.red.shade700,
                //position: BadgePosition.topEnd(),
                animationType: BadgeAnimationType.scale,
                //animationDuration: Duration(milliseconds: 250),
              )
            ),
          const SizedBox(width: 15,),
            DropPerfil(primary: primary,background_color: background_color,),
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
                   return TicketView(primary,background_color);
                 }
                )
              )
            ],
          )
      ),
    );
  }
}
