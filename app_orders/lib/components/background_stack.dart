import 'package:app_orders/screen/create_order_tabs.dart';
import 'package:app_orders/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class BackgroundStack extends StatefulWidget {
  const BackgroundStack({Key? key}) : super(key: key);

  @override
  State<BackgroundStack> createState() => _BackgroundStackState();
}

class _BackgroundStackState extends State<BackgroundStack> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    Color? primary = Colors.cyan;
    Color? secondary = Colors.cyan[800];
    Color? background_color = Color.fromARGB(255, 236, 239, 241);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          color: Colors.white,
        ),
        _background(
            height: height,
            primary: primary,
            background_color: background_color),
        
        ListOrders(primary: primary, height: height,secondary:secondary,whith: width,background_color:background_color),
        Positioned(
          top: height * 0.17,
          right: 50,
          child: FloatingActionButton.extended(
            backgroundColor: secondary,
            elevation: 5,
            onPressed: () {
              // Respond to button press
              Navigator.push(context,
                PageTransition(
                    duration: const Duration(milliseconds: 500),
                    type: PageTransitionType.fade,
                    child: CreateOrders()
                )
              );
            },
            icon:const Icon(
              Icons.add,
              color: Colors.white,
            ),
            label:const Text(
              'NUEVO PEDIDO',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}



class _background extends StatelessWidget {
  const _background({
    Key? key,
    required this.height,
    required this.primary,
    required this.background_color,
  }) : super(key: key);

  final double height;
  final Color? primary;
  final Color? background_color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background_color,
      child: Column(
        children: [
          Container(
            height: height * 0.2,
            decoration: BoxDecoration(
                color: primary,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(50))),
          ),
          Container(
            decoration: BoxDecoration(color: primary),
            child: Container(
              height: height * 0.8,
              decoration: BoxDecoration(
                  
                  color: background_color,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
