import 'package:flutter/material.dart';
import 'package:matriculasapp/models/Person_model.dart';
import 'package:matriculasapp/models/carrera_model.dart';
import 'package:matriculasapp/models/institucion_model.dart';
import 'package:matriculasapp/models/matricula_model.dart';

class MatriculasHome extends StatefulWidget {
  @override
  State<MatriculasHome> createState() => _MatriculasHomeState();
}

class _MatriculasHomeState extends State<MatriculasHome> {
  List<Person> peopleList = [
    Person(name: "Ana", address: "av 1245", phone: "12345679"),
    Person(name: "Lia", address: "av lima", phone: "9751665"),
    Person(name: "Maria", address: "av mlsis", phone: "88888888"),
  ];

  List<Carrera> carrerasList = [
    Carrera(nombre: "Contabilidad", duracion: "5 años"),
    Carrera(nombre: "Diseño", duracion: "5 años"),
  ];

  List<Matricula> matriculasList = [];

  List<Institucion> institucioneslist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matriculas App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              //AGREGAR INSTITUCIONES
              institucioneslist.add(
                Institucion(
                  nombre: "TECSUP",
                  direccion: "AV LIMA 123123",
                  ruc: "12345678",
                  telefono: "98765431",
                  matriculas: [],
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              //AGREGANDO PERSONAS
              // peopleList.add(
              //   Person(
              //       name: "Pedro",
              //       address: "av Larc0 789",
              //       phone: "1938771",
              //       dni: "12345678"),
              // );

              //AGREGANDO MATRÍCULAS
              matriculasList.add(
                Matricula(
                  fecha: "14/01/2024",
                  hora: "11:05",
                  alumno: Person(
                      name: "pedro",
                      address: "Avv cusco 123456",
                      phone: "987654321"),
                  carrera: carrerasList[1],
                ),
              );
              setState(() {});
            },
            child: Text("Agregar"),
          ),
          ...matriculasList.map(
            (e) => ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.cyan,
                radius: 25,
                child: Text(
                  e.alumno.name[0],
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              title: Text("${e.alumno.name} - ${e.carrera.nombre}"),
              subtitle: Text(e.alumno.address),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      print("Editando....");
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      print("Eliminando....");
                      // matriculasList.removeLast();
                      // matriculasList.removeRange(0, 2);
                      // matriculasList.removeAt(1);
                      matriculasList.remove(e);
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
