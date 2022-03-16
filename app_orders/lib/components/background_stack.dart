import 'package:flutter/material.dart';

class BackgroundStack extends StatefulWidget {
  const BackgroundStack({Key? key}) : super(key: key);

  @override
  State<BackgroundStack> createState() => _BackgroundStackState();
}

class _BackgroundStackState extends State<BackgroundStack> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    Color? primary = Colors.cyan[600];
    Color? secondary = Colors.cyan[800];
    Color? background_color = Colors.grey[100];
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        _background(
            height: height,
            primary: primary,
            background_color: background_color),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: primary,
            title: Image.asset(
              'assets/logos/gozeri_green.png',
              width: 100,
            ),
          ),
          body: Container(
              margin: EdgeInsets.only(top: height * 0.1), child: Column()),
        ),
        Positioned(
          top: height * 0.17,
          right: 50,
          child: FloatingActionButton.extended(
            backgroundColor: secondary,
            elevation: 5,
            onPressed: () {
              // Respond to button press
            },
            icon: Icon(
              Icons.add,
              color: background_color,
            ),
            label: Text(
              'Order',
              style: TextStyle(color: background_color),
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
