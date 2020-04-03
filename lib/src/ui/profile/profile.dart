import 'package:flutter/material.dart';
import 'package:kandangapp/models/profile_response_model.dart';
import 'package:kandangapp/src/blocs/auth_bloc.dart';
import 'package:kandangapp/src/blocs/profile_bloc.dart';
import 'package:kandangapp/src/resources/networking/api_response.dart';
import 'package:kandangapp/src/ui/pagehandling/error_page.dart';
import 'package:kandangapp/src/ui/pagehandling/profile_skeleton.dart';
import 'package:kandangapp/src/ui/profile/profile_container.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileBloc _bloc = ProfileBloc();

  @override
  Widget build(BuildContext context) {
    authBloc.restoreSession();
    return _body();
  }

  _body() {
    return StreamBuilder<ApiResponse<ProfileResponseModel>>(
      stream: _bloc.profileResponseModelStream,
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
              return ProfileContainer(user: snapshot.data.data.data, bloc: _bloc,);
              break;
            case Status.ERROR:
              return ErrorPage(
                errorMessage: snapshot.data.message,
                onRetryPressed: () => _bloc.fetchProfile(),
              );
              break;
          }
        }
        return Container();
      },
    );
  }

}