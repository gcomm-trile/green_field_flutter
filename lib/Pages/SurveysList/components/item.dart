import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({
    Key key,
    @required this.surveyname,
    @required this.projectname,
  }) : super(key: key);

  final String surveyname;
  final String projectname;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '$surveyname',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Text('$projectname',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w300),
                          textAlign: TextAlign.start),
                    ])
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.0),
              child: Container(
                height: 0.7,
                color: Colors.black,
              ),
            ),
          ],
        )

        //    Center(child: Text('Entry  ${projectnos[index]}')),
        );
  }
}
