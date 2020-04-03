import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kandangapp/models/profile_response_model.dart';
import 'package:kandangapp/src/blocs/profile_bloc.dart';
import 'package:kandangapp/src/resources/widgets/material_button.dart';

class ProfileContainer extends StatefulWidget {
  final ProfileModel user;
  final ProfileBloc bloc;
  ProfileContainer({this.user, this.bloc});

  @override
  _ProfileContainerState createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: AppBar().preferredSize.height,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Profile",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0
              ),
            ),
          ),
          Material(
            elevation: 0.1,
            color: Colors.white,
            child: InkWell(
              onTap: (){
                //Navigator.pushNamed(context, '/myprofile');
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListTile(
                      // leading: ClipRRect(
                      //   borderRadius: BorderRadius.circular(30),
                      //   child: CachedNetworkImage(
                      //     imageUrl:
                      //         widget.user.foto == null ? "" : widget.user.foto,
                      //     height: 50.0,
                      //     width: 50.0,
                      //     errorWidget: (context, url, error) =>
                      //         new Icon(FontAwesomeIcons.bug),
                      //     placeholder: (context, url) =>
                      //         CircularProgressIndicator(),
                      //   ),
                      // ),
                      title: Text(
                        widget.user.name,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        widget.user.email,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Divider(
            height: 1,
          ),
          CustomMaterialWidgetButton(
            onTaped: () {
              //Navigator.pushNamed(context, '/changepassword');
            },
            title: 'Telepon',
            iconData: FontAwesomeIcons.phone,
            isUseIcon: false,
            value: widget.user.telp,
          ),
          Divider(
            height: 1,
          ),
          CustomMaterialWidgetButton(
            onTaped: () {
              //Navigator.pushNamed(context, '/mypackage');
            },
            title: 'Gender',
            iconData: FontAwesomeIcons.userAlt,
            isUseIcon: false,
            value: widget.user.gender,
          ),
          Divider(
            height: 1,
          ),
          CustomMaterialWidgetButton(
            onTaped: () {
              //Navigator.pushNamed(context, '/mybilling');
            },
            title: 'Address',
            iconData: FontAwesomeIcons.addressCard,
            isUseIcon: false,
            value: widget.user.alamat,
          ),
          Divider(
            height: 1,
          ),
          SizedBox(
            height: 40.0,
          ),
          Divider(
            height: 1,
          ),
          CustomMaterialWidgetButton(
            onTaped: () {
              widget.bloc.logout();
            },
            title: 'Logout',
            iconData: FontAwesomeIcons.signOutAlt,
            isUseIcon: true,
          ),
          Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
  
}