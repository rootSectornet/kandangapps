import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFAFAFA),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Kandang",
                style: TextStyle(color: Color(0xFF282B60), fontSize: 24.0),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "Apps",
                style: TextStyle(color: Color(0xFFFF0054), fontSize: 24.0),
              )
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.grey[900],
            ),
            onPressed: () {
              print('Click notif');
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Kandang kami",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Show all",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height /6),
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Material(
                  elevation: 0.1,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x20000000),
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ],
                          border: Border.all(color: Color(0xFFFF0054))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xFFFF0054),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Pamulang',
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // SizedBox(height: 5,),
                                      // Text(
                                      //   'Tangerang Selatan',
                                      //   style: TextStyle(
                                      //       color: Colors.grey[500],
                                      //       fontSize: 10,
                                      //       fontWeight: FontWeight.normal),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Material(
                  elevation: 0.1,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x20000000),
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ],
                          border: Border.all(color: Color(0xFFFF0054))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xFFFF0054),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Serang',
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // SizedBox(height: 5,),
                                      // Text(
                                      //   'Banten',
                                      //   style: TextStyle(
                                      //       color: Colors.grey[500],
                                      //       fontSize: 10,
                                      //       fontWeight: FontWeight.normal),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Material(
                  elevation: 0.1,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x20000000),
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ],
                          border: Border.all(color: Color(0xFFFF0054))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xFFFF0054),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Ciawi',
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // SizedBox(height: 5,),
                                      // Text(
                                      //   'Jawa Barat',
                                      //   style: TextStyle(
                                      //       color: Colors.grey[500],
                                      //       fontSize: 10,
                                      //       fontWeight: FontWeight.normal),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Material(
                  elevation: 0.1,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x20000000),
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ],
                          border: Border.all(color: Color(0xFFFF0054))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xFFFF0054),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Bogor',
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // SizedBox(height: 5,),
                                      // Text(
                                      //   'Jawa Barat',
                                      //   style: TextStyle(
                                      //       color: Colors.grey[500],
                                      //       fontSize: 10,
                                      //       fontWeight: FontWeight.normal),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Material(
                  elevation: 0.1,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x20000000),
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ],
                          border: Border.all(color: Color(0xFFFF0054))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xFFFF0054),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Ciamis',
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // SizedBox(height: 5,),
                                      // Text(
                                      //   'Jawa Barat',
                                      //   style: TextStyle(
                                      //       color: Colors.grey[500],
                                      //       fontSize: 10,
                                      //       fontWeight: FontWeight.normal),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Material(
                  elevation: 0.1,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x20000000),
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ],
                          border: Border.all(color: Color(0xFFFF0054))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xFFFF0054),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Sukabumi',
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // SizedBox(height: 5,),
                                      // Text(
                                      //   'Jawa Barat',
                                      //   style: TextStyle(
                                      //       color: Colors.grey[500],
                                      //       fontSize: 10,
                                      //       fontWeight: FontWeight.normal),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:30.0),
            child: GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height /2),
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Material(
                  elevation: 0.1,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x20000000),
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ],
                          // border: Border.all(color: Color(0xFFFF0054))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/sheep.png',
                                fit: BoxFit.fill,
                                height: 120,
                              ),
                              SizedBox(height: 10.0,),
                              Text(
                                'Katalog',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ),
                  ),
                ),
                Material(
                  elevation: 0.1,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x20000000),
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ],
                          // border: Border.all(color: Color(0xFFFF0054))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/farmer.png',
                                fit: BoxFit.fill,
                                height: 120,
                              ),
                              SizedBox(height: 10.0,),
                              Text(
                                'Paket Ternak',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
