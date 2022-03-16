import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ListOrders extends StatefulWidget {
  const ListOrders({Key? key}) : super(key: key);

  @override
  State<ListOrders> createState() => _ListOrdersState();
}

class _ListOrdersState extends State<ListOrders> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    Color? primary = Colors.grey[600];
    Color? secondary = Colors.white;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: secondary,
        appBar: AppBar(
          iconTheme: IconThemeData(color: secondary),
          backgroundColor: primary,
          elevation: 0,
          title: Image.asset(
            'assets/logos/gozeri_white.png',
            width: 120,
          ),
        ),
        drawer: const Drawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Container(
                      height: 150,
                      width: double.infinity,
                      child: Container(
                        height: 50,
                        color: Colors.red,
                        child: Text('hola'),
                      )),
                  //SearchWidget(primary: primary),
                  /*Positioned(
                    bottom: -10,
                    right: 0,
                    child: FloatingActionButton(
                      backgroundColor: const Color(0xff03dac6),
                      foregroundColor: Colors.black,
                      onPressed: () {
                        // Respond to button press
                      },
                      child: Icon(Icons.add),
                    ),
                  )*/
                ],
              )
            ],
          ),
        ));
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.primary,
  }) : super(key: key);

  final Color? primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(
                    top: 5, left: 10, right: 10, bottom: 10),
                child: TextField(
                  cursorColor: primary,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Buscar Pedido',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.grey,
                      )),
                ),
              ))
        ],
      ),
    );
  }
}
