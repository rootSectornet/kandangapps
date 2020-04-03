import 'package:flutter/material.dart';
import 'package:kandangapp/models/kandang_response_model.dart';
import 'package:kandangapp/src/blocs/kandang_bloc.dart';
import 'package:kandangapp/src/resources/networking/api_response.dart';
import 'package:kandangapp/src/ui/kandang/all_kandang_container.dart';
import 'package:kandangapp/src/ui/pagehandling/error_page.dart';
import 'package:kandangapp/src/ui/pagehandling/profile_skeleton.dart';

class AllKandang extends StatefulWidget {

  @override
  _AllKandangState createState() => _AllKandangState();
}

class _AllKandangState extends State<AllKandang> {
  KandangBloc _bloc = KandangBloc();
  
  @override
  void initState() {
    _bloc.fetchKandangList();
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
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[     
                Icon(Icons.arrow_back_ios, color: Colors.black,),
                SizedBox(width: 20.0,),
                Text(
                  "Back ",
                  style: TextStyle(color: Color(0xFF282B60), fontSize: 24.0),
                ),
              ],
            ),
          ),
        )
      ),
      body: StreamBuilder<ApiResponse<KandangResponseModel>>(
        stream: _bloc.kandangResponseModelStream,
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
                    ? AllKandangContainer(
                      kandang: snapshot.data.data.data,
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
                  onRetryPressed: () => _bloc.fetchKandangList(),
                );
                break;
            }
          }
          return Container();
        },
      ),
    );
  }
}
