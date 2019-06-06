import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  var _img;
  var _name;
  var _description;

  Country(this._img, this._name, this._description);

  BuildContext _context;

  Country.fromMap(Map<String, dynamic> map)
      : _img = map['flag_image'],
        _name = map['name'],
        _description = map['short_description'];

  //generate the view for the listview
  @override
  Widget build(BuildContext context) {
    this._context = context;

    //Foi adicionado dentro de Container para adicionar margem no item
    return new Container(
      margin:
          const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0, top: 15.0),
      child: new Material(
        child: _getListTile(),
      ),
    );
  }

  //generate a image and text to the view
  Widget _getListTile() {
    // Foi adicionado dentro de Container para adicionar altura fixa.
    return new Container(
      height: 95.0,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
              width: 70.0,
              height: 70.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill, image: new NetworkImage(_img)))),
          _getColumText(_name, _description, _description),
        ],
      ),
    );
  }

  //generate text to the view
  Widget _getColumText(tittle, date, description) {
    return new Expanded(
        child: new Container(
      decoration: new BoxDecoration(
          border: Border(
        bottom: BorderSide(width: .5, color: Colors.black26),
      )),
      margin: new EdgeInsets.only(left: 15),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getNameWidget(_name),
          _getDescriptionWidget(_description)
        ],
      ),
    ));
  }

  Widget _getNameWidget(String curencyName) {
    return new Text(
      curencyName,
      maxLines: 1,
      style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _getDescriptionWidget(String description) {
    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: new Text(
        description,
        maxLines: 2,
        style: new TextStyle(fontSize: 15, color: Colors.black38),
      ),
    );
  }
}
