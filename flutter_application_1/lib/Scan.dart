import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ProductDataModel.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_html/flutter_html.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
          title: Text("Scans "),
          actions: <Widget>[
            Row(
              children: <Widget>[
                Image.asset("images/banner.png"),
              ],
            ),
          ],
        ),
        body: FutureBuilder(
      future: ReadJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<ProductDataModel>;
          return ListView.builder(
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Icon(
                              Icons.security,
                              size: 80,
                            ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(items[index].name.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(
                          height: 10,
                        ),
                        Html(data: items[index].mini_desc),
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }

  Future<List<ProductDataModel>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('images/scan.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
}
