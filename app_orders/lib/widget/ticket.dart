import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TicketView extends StatelessWidget {
  final Color? primary;
  final Color? background_color;
  const TicketView(this.primary,this.background_color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey[100],
                    child:const Icon(Icons.storefront,color:Colors.white),
                  ),
                  title: Text('Mesa No.1',style: GoogleFonts.getFont(
                      'Rokkitt',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  subtitle:Text('hace 30 minutos',style: GoogleFonts.getFont(
                      'Rokkitt',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    )
                  ),
                  trailing: Chip(
                    padding: const EdgeInsets.all(0),
                    backgroundColor: Colors.yellow[100],
                    label: Text('Pendiente', style: TextStyle(color: Colors.black54)),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context,index){
                    return Row(
                      children: [
                        Expanded(
                          child:Text('5',style: GoogleFonts.getFont(
                              'Rokkitt',
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.right,
                          ) 
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          flex: 5,
                          child:
                            Text('vatido de manzana',style: GoogleFonts.getFont(
                              'Rokkitt',
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                ListTile(
                  trailing: Text('Q200.00',style: GoogleFonts.getFont(
                      'Rokkitt',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: primary
                    )
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: background_color
                    ),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                      return Flex(
                        direction: Axis.horizontal,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          (constraints.constrainWidth()/10).floor(),(index)=>
                          const SizedBox(
                            height: 1,
                            width: 5,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color:Colors.blueGrey
                              ),
                            ),
                
                          )
                        ),
                      );
                    }
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),

                      ),
                      color: background_color
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              )
            ),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin:const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        //color: Theme.of(context).primaryColor,
                        color: Colors.green[700],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child:const Icon(Icons.list_alt,color: Colors.white, size: 30,) ,
                    ),
                    Container(
                      margin:const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        //color: Theme.of(context).primaryColor,
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child:const Icon(Icons.edit_note,color: Colors.white, size: 30,) ,
                    ),
                    Container(
                      margin:const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        //color: Theme.of(context).primaryColor,
                        color: Colors.red[700],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child:const Icon(Icons.delete_outline,color: Colors.white, size: 30,) ,
                    )
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
