import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:green_field/Models/respondent.dart';
import 'package:green_field/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String url =
      'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9';
  static List<Respondent> respondents = <Respondent>[
    Respondent("123", "123", "LÊ MINH TRÍ", "0936287592", "1001", "Male"),
    Respondent("123", "123", "LÊ MINH TRÍ", "0936287592", "1001", "Male"),
    Respondent("123", "123", "LÊ MINH TRÍ", "0936287592", "1001", "Female"),
    Respondent("123", "123", "LÊ MINH TRÍ", "0936287592", "1001", "Male"),
    Respondent("123", "123", "LÊ MINH TRÍ", "0936287592", "1001", "Male"),
    Respondent("123", "123", "ABC", "0936287592", "1001", "Male"),
    Respondent("123", "123", "LÊ MINH TRÍ", "0936287592", "1001", "Female"),
    Respondent("123", "123", "LÊ MINH TRÍ", "0936287592", "1001", "Male"),
    Respondent("123", "123", "LÊ MINH TRÍ", "0936287592", "1001", "Male"),
    Respondent("123", "123", "LÊ MINH TRÍ", "0936287592", "1001", "Female"),
    Respondent("123", "123", "LÊ MINH TRÍ", "0936287592", "1001", "Male"),
    Respondent("123", "123", "ABC", "0936287592", "1001", "Male")
  ];
  List<Respondent> searchRespondents = List.from(respondents);
  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryLightColor,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: searchSection,
          ),
          Expanded(child: bodySection)
        ],
      ),
    );
  }

  Widget _loader(BuildContext context, String url) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _error(BuildContext context, String url, dynamic error) {
    print(error);
    return const Center(child: Icon(Icons.error));
  }

  Widget infoSection(Respondent respondent) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: <Widget>[
            Icon(Icons.person),
            Expanded(
                child: Text(
              respondent.respondentName,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
            )),
            Icon(respondent.gender == "Male"
                ? FontAwesomeIcons.male
                : FontAwesomeIcons.female),
            Text(
              "1992",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.phone),
            Text(
              respondent.respondentPhoneNumber,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.gps_fixed),
            Expanded(
              child: Text(
                  "55 đường số 9, phường phước bình, quận 9, thành phố hồ chí minh"
                      .toLowerCase()),
            ),
          ],
        ),
      ],
    ));
  }

  Widget get rowSeparatorSection {
    return Divider(
      height: 1.0,
      thickness: 1.0,
      color: Colors.black87,
    );
  }

  Widget get avatarSection {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: _loader,
      errorWidget: _error,
      width: 100,
      height: 100,
    );
  }

  Widget get searchSection {
    return TextField(
      controller: _textController,
      decoration: InputDecoration(
        hintText: 'Nhập tìm kiếm...',
      ),
      onChanged: onItemChanged,
    );
  }

  Widget idSection(Respondent respondent) {
    return Positioned(
        child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: kPrimaryLightColor,
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(3)),
            child: Text(
              "01001",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
        top: 10,
        left: 5,
        width: 50);
  }

  Widget _buildRow(Respondent respondent) {
    return InkWell(
        onTap: itemTapped,
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Stack(
            children: <Widget>[
              Column(
                children: [
                  rowSeparatorSection,
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Row(
                          children: <Widget>[
                            avatarSection,
                            infoSection(respondent),
                          ],
                        ),
                      ),
                      idSection(respondent),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }

  void onItemChanged(String value) {
    print("search text changed");
    setState(() {
      searchRespondents = respondents
          .where((element) => element.respondentName
              .toUpperCase()
              .contains(value.toUpperCase()))
          .toList();
    });
  }

  Widget get bodySection {
    return searchRespondents.length == 0
        ? Center(
            child: Text("No respondent"),
          )
        : ListView.builder(
            itemCount: searchRespondents.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildRow(searchRespondents[index]);
            });
  }

  void itemTapped() {
    log("item tapped");
    Navigator.pushNamed(context, "questionnaire");
  }
}
