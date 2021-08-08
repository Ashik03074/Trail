import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final List<Map> sc = [
  {
    "id": 1,
    "name": "abc",
    "no": 4,
    "ss": ["AFEFEF", "efefefef", "efefavav"],
    "ss2": ["AFEVEV", "afeefefef", "efefr3r3r"],
  },
  {
    "id": 2,
    "name": "xyz",
    "no": 4,
    "ss": [
      "AFEFEFffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
      "efefefef",
      "efefavav"
    ],
    "ss2": [
      "AFEVEVfffffffffffffffffffffffffffffffffffffffffff",
      "afeefefef",
      "efefr3r3r"
    ],
  },
  {
    "id": 3,
    "name": "pqr",
    "no": 4,
    "ss": ["AFEFEF", "efefefef", "efefavav"],
    "ss2": ["AFEVEV", "afeefefef", "efefr3r3r"],
  },
  {
    "id": 4,
    "name": "def",
    "no": 4,
    "ss": ["AFEFEF", "efefefef", "efefavav"],
    "ss2": ["AFEVEV", "afeefefef", "efefr3r3r"],
  },
  {
    "id": 5,
    "name": "ghi",
    "no": 4,
    "ss": ["AFEFEF", "efefefef", "efefavav"],
    "ss2": ["AFEVEV", "afeefefef", "efefr3r3r"],
  },
  {
    "id": 6,
    "name": "ijk",
    "no": 4,
    "ss": ["AFEFEF", "efefefef", "efefavav"],
    "ss2": ["AFEVEV", "afeefefef", "efefr3r3r"],
  },
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/details': (ctx) => Detail(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text("practice"),
        ),
        body: ListView.builder(
          itemCount: sc.length,
          itemBuilder: (BuildContext context, int index) {
            return buildList(context, index);
          },
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    void goDetail(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(
        '/details',
        arguments: {'id': sc[index]['id']},
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: double.infinity,
      height: 110,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 3, color: Colors.black),
            ),
            child: Center(child: Text(sc[index]['id'].toString())),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sc[index]['name'],
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(sc[index]['name'],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13)),
              ],
            ),
          ),
          InkWell(
            onTap: () => goDetail(context),
            child: Container(
              width: 40,
              height: 40,
              //margin: EdgeInsets.only(right: 15),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 1, color: Colors.black),
              ),
              child: Center(child: Icon(Icons.arrow_forward)),
            ),
          )
        ],
      ),
    );
  }
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    //final detailId = routeArg['id'];
    final selectMeal =
        sc.firstWhere((element) => element['id'] == routeArg['id']);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal['name']),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 7),
            child: Icon(Icons.settings),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: selectMeal['ss'].length,
          itemBuilder: (BuildContext context, int index) {
            print(selectMeal['ss'].length);
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 110,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Text(selectMeal['ss'][index]),
                  Divider(),
                  Text(selectMeal['ss2'][index]),
                ],
              ),
            );
          }),
    );
  }
}
