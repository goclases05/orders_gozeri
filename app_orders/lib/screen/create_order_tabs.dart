
import 'package:app_orders/models/departamentos_model.dart';
import 'package:app_orders/providers/departamentos_provider.dart';
import 'package:app_orders/widget/widget.dart';
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

    Color? primary = Colors.cyan[600];
    Color? col_secundary = Colors.cyan[800];
    Color? col_white = Colors.white;
    var size = MediaQuery.of(context).size;
    Color? background_color = Colors.grey[200];

    String logo = 'https://app.gozeri.com/assets/img/logo.png';
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
            backgroundColor: background_color,
            appBar: AppBar(
              iconTheme: IconThemeData(color: col_white),
              backgroundColor: primary,
              title: name.isEmpty
                  ? Image.network(
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
                            color: col_white,
                          ),
                        ),
                      ],
                    ),
              bottom: TabBar(
                labelColor: col_secundary,
                isScrollable: true,
                //labelColor: Colors.grey[300],
                //indicatorColor: Colors.white,
                unselectedLabelColor: Colors.white54,
                indicator: BubbleTabIndicator(
                  indicatorHeight: 25.0,
                  indicatorColor: col_white,
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.swap_horiz,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Badge(
                    badgeContent: const Text(
                      '9',
                      style: TextStyle(color: Colors.white),
                    ),
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                    badgeColor: Colors.red,
                    //position: BadgePosition.topEnd(),
                    animationType: BadgeAnimationType.scale,
                    //animationDuration: Duration(milliseconds: 250),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ],
            ),
            body: TabBarView(
              children: tabs.map((Tab tab) {
                var id=tab.key.toString();
                String newValue = id.replaceAll("[<'", "").replaceAll("'>]", "");
                print(newValue);
                return Expanded(
                    child:
                      ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:const EdgeInsets.all(10),
                            child: ArticleHorizontal(ID_ARTICULO: newValue),
                          );
                        },
                      )
                  );
              }).toList(),
            ),
          );
        }),
      );
    
  }
}
