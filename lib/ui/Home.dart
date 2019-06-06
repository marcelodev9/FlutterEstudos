import 'package:flutter/material.dart';
import 'package:meu_primeiro_app/repository/countrys/CountryRepository.dart';
import 'package:meu_primeiro_app/support/conection/api.dart';
import 'package:meu_primeiro_app/ui/Country.dart';

class Home extends StatefulWidget {
  final state = new _NoticeListPageState();

  @override
  _NoticeListPageState createState() => state;
}

class _NoticeListPageState extends State<Home> {
  List _news = new List();
  var repository = new NoticeRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Países"),
      ),
      body: new Container(
        child: _getListViewWidget(),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    loadNotices();
  }

  Widget _getListViewWidget() {
    return new Container(
      margin: new EdgeInsets.only(top: 10, left: 15, right: 15),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            "Escolha seu destino",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 18),
          ),
          new Expanded(
              child: new Container(
            margin: new EdgeInsets.only(top: 10),
            child: new ListView.builder(
                itemCount: _news.length,
                padding: new EdgeInsets.only(top: 5.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: _news[index],
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Country())),
                  );
                }),
          ))
        ],
      ),
    );
  }

  _showImplError(onError) {
    print(onError);
    if (onError is FetchDataException) {
      print("codigo: ${onError.code()}");
    }
  }

  setNotices(List result) {
    setState(() {
      result.forEach((item) {
        _news.add(item);
      });
    });
  }

  loadNotices() async {
    await repository
        .loadCountrys()
        .then((country) => setNotices(country))
        .catchError(_showImplError);
  }
}
