import 'package:flutter/material.dart';
import 'package:kandangapp/models/kandang_response_model.dart';
import 'package:kandangapp/src/blocs/kandang_bloc.dart';
import 'package:kandangapp/src/resources/networking/api_response.dart';
import 'package:kandangapp/src/ui/pagehandling/error_page.dart';
import 'package:kandangapp/src/ui/pagehandling/placeholder.dart';
import 'package:kandangapp/src/utils/arguments_helper.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  KandangBloc _bloc;
  
  @override
  void initState() {
    _bloc = KandangBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
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
          media.width > 600
              ? Flexible(flex: 1, child: ListView())
              : Container(),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Kandang kami",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "/allkandang"),
                  child: Text(
                    "Show all",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder<ApiResponse<KandangResponseModel>>(
            stream: _bloc.kandangResponseModelStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data.status) {
                  case Status.LOADING:
                    return HorizontalListPlaceHolder(
                      height: 200.0,
                      width: 180.0,
                    );
                    break;
                  case Status.COMPLETED:
                    return kandangContainer(snapshot, context);
                    break;
                  case Status.ERROR:
                    return ErrorPage(
                      errorMessage: snapshot.data.message,
                      onRetryPressed: () => _bloc.fetchKandangList(),
                    );
                    break;
                }
              }
              return Container();
            },
          ),
          Padding(
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
                                'assets/images/sheep.png',
                                fit: BoxFit.fill,
                                height: 120,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Katalog',
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
                    onTap: () {
                      Navigator.pushNamed(context, "/paketternak");
                    },
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
                                'Paket Ternak',
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
        ],
      ),
    );
  }

  Padding kandangContainer(
      AsyncSnapshot<ApiResponse<KandangResponseModel>> snapshot,
      BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: GridView.builder(
          itemCount: snapshot.data.data.data.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(8.0),
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 6),
          ),
          itemBuilder: (BuildContext context, int index) {
            return Material(
              elevation: 0.1,
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: InkWell(
                onTap: () async {
                  Navigator.pushNamed(context, '/category', arguments: ScreenArguments(
                    id: snapshot.data.data.data[index].placeId,
                    name: snapshot.data.data.data[index].placeName
                  ));
                },
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
                        border: Border.all(color: Color(0xFFFF0054))),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    snapshot.data.data.data[index].placeName,
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            );
          }),
    );
  }
}
