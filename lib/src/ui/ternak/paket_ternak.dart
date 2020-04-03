import 'package:flutter/material.dart';

class PaketTernak extends StatefulWidget {
  @override
  _PaketTernakState createState() => _PaketTernakState();
}

class _PaketTernakState extends State<PaketTernak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFAFAFA),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[     
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, color: Colors.black,)
              ),
              SizedBox(width: 20.0,),
              Text(
                "Paket ",
                style: TextStyle(color: Color(0xFF282B60), fontSize: 24.0),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "Perawatan",
                style: TextStyle(color: Color(0xFF282B60), fontSize: 24.0),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: GridView.count(
          shrinkWrap: true,
          padding: EdgeInsets.all(8.0),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.5),
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
                    height: 100.0,
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
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Paket Harian',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
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
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Paket Bulanan',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      )
    );
  }
}
