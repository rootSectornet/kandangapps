import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
    this.isScroll = false, this.placeName,

  });
  final String placeName;
  final bool isScroll;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(null, 220);
}

class _CustomAppBarState extends State<CustomAppBar> {

  final bottom = Flexible(
    flex: 4,
    child: Padding(
      padding: const EdgeInsets.only(top: 0.0, bottom: 0.0, left: 24.0, right: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Icon(
                Icons.wb_sunny,
                size: 16,
                //color: Colors.white,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "Kandang",
                style: TextStyle(
                  fontSize: 12, 
                  color: Colors.black38
                ),
              ),
            ],
          ),
          
          // Icon(Icons.settings,color: Colors.white,),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    
    return PreferredSize(
      preferredSize: Size(null, 220),
      child: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.white, Colors.white24],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: 170,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
          child: Container(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 38, 0, 0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, bottom: 0.0, left: 18.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kandang " + widget.placeName,
                          style: TextStyle(
                            fontSize: 34, 
                            color: Colors.black
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.notifications),
                          //iconSize: 20,
                          color: Colors.grey,
                          onPressed: () {
                            // _scaffoldKey.currentState.openDrawer();
                          },
                        ),
                        // Icon(Icons.settings,color: Colors.white,),
                      ],
                    ),
                  ),
                  Container(
                    height: 73.0,
                    // color: Colors.amber,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: index == 0 ? 20.0 : 8.0,
                              right: 8.0,
                              top: 8.0,
                              bottom: 8.0),
                          child: Container(
                            height: 20,
                            width: 160,
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
                            border: Border.all(color: Color(0xFFFF0054))),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.videocam,
                                    color: Color(0xFFFF0054)
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    "LIVE CCTV "+ index.toString(),
                                    style: TextStyle(
                                      color: Color(0xFFFF0054)
                                    ),
                                  ),
                                ],
                              )
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}