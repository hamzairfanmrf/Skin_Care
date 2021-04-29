import 'package:flutter/material.dart';
import 'package:skin_care/Check_List.dart';
import 'package:skin_care/Crouser.dart';
import 'package:skin_care/below_buttons.dart';
import 'package:skin_care/just_check.dart';


class AnotherNav extends StatefulWidget {
  @override
  _AnotherNavState createState() => _AnotherNavState();
}

class _AnotherNavState extends State<AnotherNav> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueAccent,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 20),
        child: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 20,
            onPressed: () {},
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  shape: BoxShape.circle,
                  color: Color(0xFF7FAD39)
              ),
              child: Icon(Icons.shopping_cart_outlined, size: 40),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: new Container(
        height: 80.0,
        color: Colors.white,
        padding: new EdgeInsets.only(top: 20.0),
        child: new Theme(

          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Color(0xFF7FAD39),
              bottomAppBarColor: Colors.green,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.grey))), // sets the inactive color of the `BottomNavigationBar`
          child:
          new BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex:0 ,
              items: [
                BottomNavigationBarItem(
                    icon: InkWell(child: new Icon(Icons.home),
                      onTap: (){
                      setState(() {
                        print('index 1');
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                            CheckList())

                        );

                      });
                      },

                    ),
                    title: new Text('Home'),
                    backgroundColor: Colors.black
                ),
                BottomNavigationBarItem(

                  icon: InkWell(child: new Icon(Icons.local_offer),
                  onTap: (){
                    setState(() {
                      print('index2');
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                          MyHomePage())

                      );
                    });
                  },
                  ),
                  title: new Text('Offer'),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_border,color: Colors.transparent,),
                    title: Text('Cart')
                ),

                BottomNavigationBarItem(
                    icon: InkWell(child: Icon(Icons.favorite),
                    onTap: (){
                    setState(() {
                      print('index3');
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              CarouselWithIndicatorDemo())

                      );
                    });
                    },
                    ),
                    title: Text('favourite')
                ),
                BottomNavigationBarItem(
                    icon: InkWell(child: Icon(Icons.menu_outlined),
                    onTap: (){
                      setState(() {
                        print('index4');
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                just_check())

                        );
                      });
                    },
                    ),
                    title: Text('more')
                ),

              ]),
        ),
      ),
    );
  }
}
