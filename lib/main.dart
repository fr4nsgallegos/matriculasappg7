import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MatriculasHome(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MatriculasHome extends StatefulWidget {
  @override
  State<MatriculasHome> createState() => _MatriculasHomeState();
}

class _MatriculasHomeState extends State<MatriculasHome> {
  List<String> names = ["ana", "paz", "luana"];

  List<Map<String, dynamic>> peopleList = [
    {"name": "Ana", "adress": "av 1245", "phone": "12345679"},
    {"name": "Lia", "adress": "av lima", "phone": "9751665"},
    {"name": "Maria", "adress": "av mlsis", "phone": "88888888"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matriculas App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              peopleList.add(
                {
                  "name": "Pedro",
                  "adress": "av larco 789",
                  "phone": "11111111",
                  "DNI": "1234567"
                },
              );
              setState(() {});
            },
            child: Text("Agregar"),
          ),
          ...peopleList.map((e) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.cyan,
                  radius: 25,
                  child: Text(
                    e["name"][0],
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                title: Text(e["name"]),
                subtitle: Text(e["adress"]),
                trailing: Text(e["phone"]),
              )),
          // Text("HIJOS"),
          // ...names.map((e) => Text("hola", style: TextStyle(fontSize: 30),)),
          // ...names.map((e) => Text(e, style: TextStyle(fontSize: 30 ),)),
          // ...List.generate(names.length, (index) => Text(names[index])),
        ],
      ),
    );
  }
}
