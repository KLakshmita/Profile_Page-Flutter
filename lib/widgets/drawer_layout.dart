import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_profile_settings_app/bloc/drawer_bloc.dart';
import 'package:user_profile_settings_app/pages/user_profile_screen.dart';
import 'package:user_profile_settings_app/widgets/custom_app_bar.dart';

class DrawerLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          key: _scaffoldKey,
          
           bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(
          iconSize: 26,
          selectedIconTheme: IconThemeData(
            color: const Color(0xFF200087),
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.black12,
          ),
          items: [
             BottomNavigationBarItem(
              icon: Padding(
                child: Icon(Icons.person),
                padding: const EdgeInsets.only(top: 4.0),
              ),
              title: Text(
                "Profile",
                style: const TextStyle(color: Colors.pink,fontSize: 10),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Icon(Icons.fastfood),
              ),
              title: Text(
                "Meals",
                style: const TextStyle(color: Colors.pink,fontSize: 10),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                child: Icon(Icons.favorite),
                padding: const EdgeInsets.only(top: 4.0),
              ),
              title: Text(
                "BMI",
                style: const TextStyle(color: Colors.pink,fontSize: 10),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                child: Icon(Icons.home),
                padding: const EdgeInsets.only(top: 4.0),
              ),
              title: Text(
                "Profile",
                style: const TextStyle(color: Colors.pink, fontSize: 10),
              ),
            ),
           
          ],
        ),
      ),
          body: Column(
            children: <Widget>[
              BlocBuilder<DrawerBloc, DrawerStates>(
                builder: (context, DrawerStates state) {
                  return CustomAppBar(
                    isBig: (state is UserProfileScreen),
                    height: (state is UserProfileScreen) ? 250 : 150,
                   leading: IconButton(
                      onPressed: () {},
                      icon: Container(
                     
                      ),
                    ),
                    title: findSelectedTitle(state),
                    trailing: IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState.openEndDrawer();
                      },
                      icon: Container(
                   
                      ),
                    ),
                    childHeight: 100,
                    child: (state is UserProfileScreen)
                        ? ClipOval(
                            child: Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              height: 100,
                              width: 100,
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all( color: Colors.white, width: 2),
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: 80,
                                //  color: Theme.of(context).primaryColor,
                                 color: Colors.lightBlueAccent,
                                ),
                                
                              ),
                            ),
                          )
                        : null,
                  );
                },
              ),
             
              Padding(
                    padding: EdgeInsets.all(0.0),
                  ),
                  Center(
                     child: Container(
                        margin: const EdgeInsets.all(0.0),
                         color: Colors.white,
                           width: 350.0,
                          height: 300.0,
                         
                          child :     Text(
                      '\n  Name    :   abc\n  Age        :  29 \n\  Dob        :  12/1/1992\n  Phone    :   98764298768\n  Gender   :  Male \n  Height    :   178 cm\n  Weight   : 70 kg\n  Email     :   abc@gmail.com',
                      style: TextStyle(
                        //color: Theme.of(context).accentColor,
                        color: Colors.black,
                        fontSize: 20,
                      
                      ),

                      )
                           ),
                      ),
                       Padding(
                    padding: EdgeInsets.all(30.0),
                  ),
                 Center( 
                        child : Container(
                       
                       /*       child: Center(
                            child: Text(
                             "Edit Details",
                     textAlign: TextAlign.center, style: TextStyle(
                        //color: Theme.of(context).accentColor,
                        color: Colors.black,
                        fontSize: 20,
                      //  fontFamily: 'Bebas',
                       // fontWeight: FontWeight.bold,
                      ),
                      
                     ),
                     ),
                         color: Colors.white,
                           width: 350.0,
                       height: 50.0,  */

                        color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                    onPressed: () {},
                    color: Colors.white,
                    child: Text(
                      "Edit Details",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway',
                        fontSize: 22.0,
                      ),
                    ),
                  ),

                      )
                      ),
                        Padding(
                    padding: EdgeInsets.all(30.0),
                  ),
                   Center( 
                        child : Container(
                       
                /*              child: Center(
                      child: Text(
                        "Log Out",
                     textAlign: TextAlign.center, style: TextStyle(
                        
                        color: Colors.black,
                        fontSize: 20,
                     
                      ),
                      
                      ),
                     ),
                         color: Colors.white,
                           width: 350.0,
                          height: 50.0,*/
                          
                        color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                    onPressed: () {},
                    color: Colors.white,
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway',
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                           
                          
                      )
                      ),
            ],
          ),
        );
      },
    );
  }

  String findSelectedTitle(DrawerStates state) {
    if (state is UserProfileScreen) {
      return "User Profile";
    } else {
 //     assert(state is NotificationScreen);
   //   return "Notifications";
    }
  }
}
