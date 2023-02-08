import 'package:flutter/material.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int selectedPage = 0;
  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  PreferredSizeWidget appBarCustom = AppBar(
    title: const Text("Inicio"),
    backgroundColor: Colors.orangeAccent,
  );

  modifyAppBar(color, titulo) {
    setState(() {
      appBarCustom = AppBar(
        title: Text(titulo),
        backgroundColor: color,
      );
    });
  }

  selectionTab(position) {
    switch(position) {
      case 0: modifyAppBar(Colors.orangeAccent, "Inicio");
      break;
      case 1: modifyAppBar(Colors.deepPurpleAccent, "Favoritos");
      break;
      case 2: modifyAppBar(Colors.green, "Listados");
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarCustom,
        body: pages[selectedPage],
        bottomNavigationBar: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 5)
                ]
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
              ),
              child: BottomNavigationBar(
                currentIndex: selectedPage,
                items: itemsBNB(),
                onTap: (position) {
                  setState(() {
                    selectedPage = position;
                    selectionTab(position);
                  });
                },
              ),
            )
        )
    );
  }

  List<BottomNavigationBarItem> itemsBNB() {
    List<BottomNavigationBarItem> lista = [];
    lista.add(
        const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio"
        )
    );
    lista.add(
        const BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favoritos"
        )
    );
    lista.add(
        const BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Listados"
        )
    );
    return lista;
  }

}



class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text("Data Tables"),),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith((states) => Colors.green),
                dataRowColor: MaterialStateColor.resolveWith((states) => Colors.amber),
                columns: addHeaders(),
                rows: addRows(),
                sortColumnIndex: 0,
                sortAscending: true,
              ),
            )
        )
    );
  }

  List<DataColumn> addHeaders() {
    List<DataColumn> list = [];
    list.add(DataColumn(label: Text("Nombres y Apellidos")));
    return list;
  }

  List<DataRow> addRows() {
    List<DataRow> list = [];
    List<DataCell> listaCelda = [];
    listaCelda.add(DataCell(Text("cristina chura")));
    list.add(DataRow(cells: listaCelda));
    listaCelda = [];
    listaCelda.add(DataCell(Text("junior vargas")));
    list.add(DataRow(cells: listaCelda));
    listaCelda = [];
    listaCelda.add(DataCell(Text("xavier aruquipa")));
    list.add(DataRow(cells: listaCelda));
    return list;
  }
}


class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.star, size: 150, color: Colors.deepPurpleAccent,),
          SizedBox(height: 30,),
          Text("Favoritos", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.star, size: 150, color: Colors.green,),
          SizedBox(height: 30,),
          Text("Listados", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}