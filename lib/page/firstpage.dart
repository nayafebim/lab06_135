import "package:flutter/material.dart";
import "package:lab06_135/hobby.dart";
class Myfirstpage extends StatefulWidget {
  const Myfirstpage({super.key});

  @override
  State<Myfirstpage> createState() => _MyfirstpageState();
}

class _MyfirstpageState extends State<Myfirstpage> {
  List<Hobby> hoobies = [];
  List selectedItems = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hoobies = Hobby.getHobby();
    print(hoobies);
  }

  List<Widget> createHobbyCheckbox(){
    List<Widget> mywidget =[];

    for (var hb in hoobies) {
      mywidget.add(
        CheckboxListTile(
          title: Text(hb.name),
          value: hb.checked, onChanged: (value) {
            
            setState(() {
              hb.checked = value!;

              if(value == true){
                selectedItems.add(hb.name);
              }else{
                selectedItems.remove(hb.name);
              }



            });
        },)
      );
      
    }

    return mywidget;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Lab06 CheckboxListTile"),
      ),
    body: Column(
      children: [
        Text("งานอดิเรก"),

        Column(
          children: createHobbyCheckbox(),
        ), 
        Text(selectedItems.toString())
       
        //ใส่ checkbox 
     
      ]
    ) ,

    );
  }
}

