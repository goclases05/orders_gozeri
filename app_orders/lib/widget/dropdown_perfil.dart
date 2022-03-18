import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropPerfil extends StatelessWidget {
  const DropPerfil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: const Icon(Icons.more_horiz_sharp,color: Colors.white,size: 30,),
        customItemsIndexes: const [3],
        //customItemsHeight: ,
        items: [
          DropdownMenuItem<Divider>(
              enabled: false,
              child: ListTile(
                title: const Text("Perfil"),
                leading: const Icon(Icons.person),
                onTap: () {
                  print("item 1");
                },
              )),
          DropdownMenuItem<Divider>(
              enabled: false,
              child: ListTile(
                title: const Text("Escritorio"),
                leading: const Icon(Icons.home),
                onTap: () {
                  print("item 2");
                },
              )),
          DropdownMenuItem<Divider>(
              enabled: false,
              child: ListTile(
                title: const Text("Ajustes"),
                leading: const Icon(Icons.settings),
                onTap: () {
                  print("item 3");
                },
              )),
          DropdownMenuItem<Divider>(
              enabled: false,
              child: ListTile(
                title: const Text("Salir"),
                leading: const Icon(Icons.logout),
                onTap: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('Login', (ruta) => false);
                  //Navigator.pushReplacementNamed(context, 'Login');
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