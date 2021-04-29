import 'package:flutter/material.dart';
import 'package:skin_care/api.dart';

class CheckList extends StatefulWidget {
  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  var cat=APi.instance;
  void getProducts() async {
    var a = await cat.Orders_List(context);

    print(cat.category.length);
    print(cat.category[0].c_name);
  }

  @override
  Widget build(BuildContext context) {
    getProducts();

    return  Scaffold(
      body: Container(

        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cat.category.length == null ? 0 : cat.category.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context,int i){
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage('images/skincare_image4.jpg'),
                                  ),
                                  Text('i am available',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ),
                          Expanded(child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage('images/skincare_image4.jpg'),
                                  ),
                                  Text('i am available'),
                                ],
                              ),
                            ),
                          ),
                          ),
                          Expanded(child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage('images/skincare_image4.jpg'),
                                  ),
                                  Text('i am available'),
                                ],
                              ),
                            ),
                          ),
                          ),

                        ],

                      ),
                    ],
                  );
                }




                  ),
            ),

              ],
            ),

            ),
    );



  }
}

class ReuseableCard extends StatelessWidget {
  int imgno;
  String txt;
  ReuseableCard(@required this.imgno,@required this.txt);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),


        ),

        child: Column(
          children: [
            Image(
              image: AssetImage('images/skincare_image$imgno.jpg'),
            ),
            Text(
              '$txt',
            )
          ],
        ),

      ),
    ),
    );
  }
}
