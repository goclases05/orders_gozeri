import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropPerfil extends StatelessWidget {
  const DropPerfil({
    Key? key, this.primary, this.background_color,
  }) : super(key: key);

  final Color? primary;
  final Color?background_color;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
            child: DropdownButton2(
              customButton: Container(
              padding: const EdgeInsets.only(top: 2),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: background_color,
                child:const Icon(Icons.more_horiz,size: 30,color: Colors.black54,),
                //const Icon(Icons.person,size:25,color: Colors.white,)
              ),
            ),
              customItemsIndexes: const [3],
              //customItemsHeight: ,
              items: [
                DropdownMenuItem<Divider>(enabled: false, child: ListTile(
                  title:const Text("Perfil"),
                  leading:const Icon(Icons.person),
                  onTap: (){
                      print("item 1");
                  },
                )),
                DropdownMenuItem<Divider>(enabled: false, child: ListTile(
                  title:const Text("Escritorio"),
                  leading:const Icon(Icons.home),
                  onTap: (){
                      print("item 2");
                  },
                )),
                DropdownMenuItem<Divider>(enabled: false, child: ListTile(
                  title:const Text("Ajustes"),
                  leading:const Icon(Icons.settings),
                  onTap: (){
                      print("item 3");
                  },
                )),
                DropdownMenuItem<Divider>(enabled: false, child: ListTile(
                  title:const Text("Salir"),
                  leading:const Icon(Icons.logout),
                  onTap: (){
                      print("item 3");
                  },
                )),
              ],
              onChanged: (value) {
              print(value);
              },
              itemHeight: 50,
              itemPadding: const EdgeInsets.only(left: 0, right: 0),
              dropdownWidth: 160,
              dropdownPadding: const EdgeInsets.symmetric(vertical: 0),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              dropdownElevation: 8,
              offset: const Offset(0, 8),
            ),
          );
  }
}