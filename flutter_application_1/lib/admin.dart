import 'package:flutter/material.dart';
import 'package:flutter_application_1/Blog.dart';
import 'package:flutter_application_1/Scan.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome to "),
          actions: <Widget>[
            Row(
              children: <Widget>[
                Image.asset("images/banner.png"),
              ],
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Padding(
          padding: EdgeInsets.only(left: 50),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 150,
                      width: 150,
                      child: Card(
                          child: new InkWell(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ScanPage()),
                          ),
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.security,
                              size: 80,
                            ),
                            SizedBox(
                              height: 17,
                            ),
                            Text(
                              "Scan Tools",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          child: Card(
                              child: InkWell(
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlogPage()),
                              ),
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.article,
                                  size: 80,
                                ),
                                SizedBox(
                                  height: 17,
                                ),
                                Text(
                                  "Blog",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ],
                    )
                  ],
                ),
              ]),
        ));
  }
}
