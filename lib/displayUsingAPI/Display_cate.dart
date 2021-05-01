import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_care/displayUsingAPI/Get_Products.dart';
import '../API/api.dart';
import '../Model/categories.dart';


class CheckImage extends StatefulWidget {
  @override
  _CheckImageState createState() => _CheckImageState();
}

class _CheckImageState extends State<CheckImage> {
  APi items = APi.instance;
  List<Categories> myCatgories = new List<Categories>();

  void getProducts() async {
    var a = await items.Orders_List(context);

    setState(() {
      myCatgories = items.category;
    });
  }


  @override
  Widget build(BuildContext context) {
    getProducts();

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 200,
        child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,


            ),
                itemCount: myCatgories.length,
                shrinkWrap: true,

                scrollDirection: Axis.vertical,

                itemBuilder: (context, index)

            {

              return GestureDetector(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),

                  ),



                  child:  Row(


                    children: [

                      Expanded(child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        items.baseURLCategories + myCatgories[index].img),
                                    fit: BoxFit.cover,
                                  ),

                                ),
                                height: double.infinity,


                              ),




                            ),
                          ),
                          Text(
                            '${myCatgories[index].c_name}'
                          )


                        ],
                      ),
                      ),


                    ],
                  ),


                ),
                onTap: (){
                  var a=myCatgories[index].c_id;
                  print(a);
                  setState(() {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GetProducts(a)),
                    );
                  });
                },
              );

            }


          ),
      ),
    );
  }
}
