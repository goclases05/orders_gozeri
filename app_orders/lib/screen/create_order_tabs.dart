
import 'package:app_orders/components/tabview.dart';
import 'package:app_orders/models/departamentos_model.dart';
import 'package:app_orders/providers/departamentos_provider.dart';
import 'package:badges/badges.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CreateOrders extends StatefulWidget {
  const CreateOrders({Key? key}) : super(key: key);

  @override
  State<CreateOrders> createState() => _CreateOrdersScreenState();
}

class _CreateOrdersScreenState extends State<CreateOrders>{

  

  /*List<Tab> tabs = const <Tab>[
    Tab(
      text: 'Agricultura',
    ),
    Tab(text: 'Alimentos'),
    Tab(text: 'Familia'),
    Tab(text: 'Ferreteria'),
    Tab(text: 'Hogar'),
    Tab(text: 'Instrumentos'),
    Tab(text: 'Oficina'),
    Tab(text: 'Servicios'),
    Tab(text: 'Tecnologia'),
  ];*/


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  final moviesprovider=Provider.of<DepartamentoProvider>(context);
  print(moviesprovider.onDisplayMovie);

  final List<Departamento> depa=moviesprovider.onDisplayMovie;

  List<Tab> tabs = <Tab>[

  ];

  for(int i=0;i<depa.length;i++){

    tabs.add(
       Tab(
          key: ValueKey(depa[i].id),
          text: depa[i].departamento,
        )
    );

  }

    Color? primary = Colors.cyan;
    Color? secondary = Colors.cyan[800];
    Color? background_color = const Color.fromARGB(255, 236, 239, 241);
    Color? texto_color=Colors.white;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    String logo = 'assets/gzeri.png';
    var name = 'Mesa No.1';
    //getCursosData();
      return DefaultTabController(
        length: tabs.length,
        // The Builder widget is used to have a different BuildContext to access
        // closest DefaultTabController.
        child: FutureBuilder(
            //future: getCursosData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              // Your code goes here.
              // To get index of current tab use tabController.index
            }
          });
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(color: texto_color),
              backgroundColor: primary,
              title: name.isEmpty
                  ? Image.asset(
                      logo,
                      width: 100,
                    )
                  : Row(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: texto_color,
                          ),
                        ),
                      ],
                    ),
              bottom: TabBar(
                labelColor: primary,
                isScrollable: true,
                //labelColor: Colors.grey[300],
                //indicatorColor: Colors.white,
                unselectedLabelColor: Color.fromARGB(255, 228, 228, 228),
                indicator:const BubbleTabIndicator(
                  indicatorHeight: 25.0,
                  indicatorColor: Colors.white,
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                  // Other flags
                  // indicatorRadius: 1,
                  // insets: EdgeInsets.all(1),
                  // padding: EdgeInsets.all(10)
                ),
                tabs: tabs,
              ),
              actions: [
                IconButton(
                  onPressed: (){}, 
                  icon:  CircleAvatar(
                        backgroundColor: background_color,
                        radius: 18,
                        child: const Icon(
                          Icons.swap_horiz,
                          size: 25,
                          color: Colors.black54,
                        ))
                ),
                IconButton(
                  onPressed: (){}, 
                  icon:  Badge(
                      badgeContent: const Text(
                        '9',
                        style: TextStyle(color: Colors.white),
                      ),
                      child: CircleAvatar(
                          backgroundColor: background_color,
                          radius: 18,
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            size: 25,
                            color: Colors.black54,
                          )),
                      badgeColor: Colors.red.shade700,
                      //position: BadgePosition.topEnd(),
                      animationType: BadgeAnimationType.scale,
                      //animationDuration: Duration(milliseconds: 250),
                    )
                ),
                IconButton(
                  onPressed: (){}, 
                  icon:  Badge(
                      badgeContent: const Text(
                        '1',
                        style: TextStyle(color: Colors.white),
                      ),
                      child: CircleAvatar(
                          backgroundColor: background_color,
                          radius: 18,
                          child: const Icon(
                            Icons.search_outlined,
                            size: 25,
                            color: Colors.black54,
                          )),
                      badgeColor: Colors.red.shade700,
                      //position: BadgePosition.topEnd(),
                      animationType: BadgeAnimationType.scale,
                      //animationDuration: Duration(milliseconds: 250),
                    )
                ),
                const SizedBox(width: 10,)
              ],
            ),
            body: TabBarView(
              children: tabs.map((Tab tab) {
                var id=tab.key.toString();
                String newValue = id.replaceAll("[<'", "").replaceAll("'>]", "");
                
                return PageTab(id_depa: newValue,background_color: background_color,primary: primary,);
              }).toList(),
            ),
          );
        }),
      );
    
  }
}
