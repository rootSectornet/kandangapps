import 'package:flutter/material.dart';
import 'package:kandangapp/models/katalog_response_model.dart';
import 'package:kandangapp/src/blocs/katalog_bloc.dart';
import 'package:kandangapp/src/resources/networking/api_response.dart';
import 'package:kandangapp/src/ui/katalog/katalog_container.dart';
import 'package:kandangapp/src/ui/pagehandling/error_page.dart';
import 'package:kandangapp/src/ui/pagehandling/profile_skeleton.dart';

class Katalog extends StatefulWidget {
  @override
  _KatalogState createState() => _KatalogState();
}

class _KatalogState extends State<Katalog> {
  KatalogBloc _bloc;

  @override
  void initState() {
    _bloc = KatalogBloc();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

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
              Text(
                "Katalog ",
                style: TextStyle(color: Color(0xFF282B60), fontSize: 24.0),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "Ternak",
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
      body: StreamBuilder<ApiResponse<KatalogResponseModel>>(
        stream: _bloc.katalogResponseModelStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data.status) {
              case Status.LOADING:
                return ProfileSkeleton(
                  height: 200.0,
                  width: 180.0,
                );
                break;
              case Status.COMPLETED:
                return snapshot.data.data.data.length != 0
                    ? KatalogContainer(
                        katalog: snapshot.data.data.data,
                      )
                    : Center(
                        child: Text(
                          "Data not found",
                          style: TextStyle(color: Colors.grey, fontSize: 18.0),
                        ),
                      );
                break;
              case Status.ERROR:
                return ErrorPage(
                  errorMessage: snapshot.data.message,
                  // onRetryPressed: () => _bloc.fetchCategory(widget.args.id),
                );
                break;
            }
          }
          return Container();
        },
      ),
    );

    // return KatalogContainer();
  }
}
