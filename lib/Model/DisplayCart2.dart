import 'package:flutter/material.dart';
import 'package:skin_care/API/api.dart';
import 'package:skin_care/Model/CART2.dart';
import 'package:skin_care/Model/Check_database.dart';
import 'package:skin_care/sizeConfig/size_config.dart';
String imageURL;
int totalOfProducts=0;

class DisplayCart2 extends StatefulWidget {
  const DisplayCart2({Key key}) : super(key: key);

  @override
  _DisplayCart2State createState() => _DisplayCart2State();
}

class _DisplayCart2State extends State<DisplayCart2> {
  APi aPi=APi.instance;
  CheckDB checkDB=CheckDB.instance;
  List<Cart2> li=[];
  Future<void> getCartItems() async {
    var a=await checkDB.carts();
    print("length of cart is ${a.length}");
    setState(() {
      li=a;

    });
  }

  Future<void> getTotal() async{
    var a=await checkDB.calTotal();
    setState(() {
      totalOfProducts=a;
    });
  }

  @override
  Widget build(BuildContext context) {
    imageURL=aPi.baseURLProducts;
    getCartItems();
    getTotal();

   return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: Text(
          'CART',
          style: TextStyle(
              color: Colors.green
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: li.length,

          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightGreen)
                  ),


                  child: Row(

                    children: [
                      Container(

                        child: Image(
                          image: NetworkImage(
                            imageURL+li[index].image,
                          ),
                        ),
                        height: 100,
                      ),
                      SizedBox(width: 20),

                      Column(
                        children: [


                          Container(

                            child: Text("${li[index].name}",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Source Sans Pro",

                              ),


                            ),
                            width: getProportionateScreenWidth(110),
                          ),

                          SizedBox(height: 5),
                          Container(
                            margin: EdgeInsets.only(right: 60),
                            child: Text("${li[index].price} AED",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          // Container(child: Text(
                          // "Quantity = ${li[index].quantity}",
                          // ),
                          //   margin: EdgeInsets.only(right: 30),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(margin: EdgeInsets.only(right: 40),
                            child: Row(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.lightGreen,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: (){
                                    setState(() async{
                                      var increase=await checkDB.increaseQuantity(li[index].product_id);
                                      var update=await checkDB.updateTotal(li[index].product_id, li[index].price);

                                    });
                                  },
                                ),
                                // SizedBox(
                                //   width: 5,
                                // ),
                                Container(
                                  margin: EdgeInsets.only(right:10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color:Color(0xFFF1F3F4),
                                  ),

                                  child: Text(
                                    "${li[index].quantity}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   width: 5,
                                // ),
                                GestureDetector(
                                  child: Container(
                                    //margin: EdgeInsets.only(right: 30),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.lightGreen,
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: (){
                                    setState(() async{
                                      var increase=await checkDB.decreaseQuantity(li[index].product_id);
                                      var update=await checkDB.updateTotal(li[index].product_id, li[index].price);

                                    });
                                  },
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 90),
                        child: Column(
                          children: [
                            GestureDetector(

                              child: Icon(
                                Icons.delete_forever,
                                size: 30,
                                color: Colors.lightGreen,
                              ),
                              onTap: ()  {
                                setState(() async{
                                  var w=await CheckDB.checkDB.deleteProductID(li[index].product_id);
                                });

                              },
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Delete',

                            ),
                          ],
                        ),
                      ),


                    ],
                  ),

                ),
                SizedBox(height: 20,),





              ],
            );




          }
      ),
      bottomNavigationBar: Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Color(0xFFF1F3F4),
            boxShadow: [BoxShadow(offset: Offset(0,-15),
                blurRadius: 20
            ),
            ]

        ),
        child: Column(
          children: [
            // Row(
            //   children: [
            //
            //     Container(
            //       margin: EdgeInsets.fromLTRB(40, 20, 0, 0),
            //       width: getProportionateScreenWidth(180),
            //       height: getProportionateScreenWidth(60),
            //       child: Image(
            //         image: AssetImage('images/skin_food.jpeg'),
            //       ),
            //     )
            //
            //   ],
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    child: Text(
                      "SUB-TOTAL",
                    ),

                  ),
                  Container(
                    child: Text(
                      "$totalOfProducts AED",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    child: Text(
                      "TAX",
                      style: TextStyle(

                      ),
                    ),

                  ),
                  Container(
                    child: Text(
                      "0 AED",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,

                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    child: Text(
                      "DELIVERY",
                    ),

                  ),
                  Container(
                    child: Text(
                      "FREE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(


                    child: Text(
                      "TOTAL",
                    ),
                    margin: EdgeInsets.only(left: 10),

                  ),
                  Container(
                    child: Text(
                      "$totalOfProducts AED",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    margin: EdgeInsets.only(right: 5),
                  )
                ],
              ),
            ),
            Row(
              children: [

                Expanded(
                  child: SizedBox(
                    width: getProportionateScreenWidth(190),
                    child: TextButton(
                      style: TextButton.styleFrom(

                        backgroundColor: Color(0xFF7FAD39),
                      ),
                      child: Text(
                        'CHECK OUT',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )


              ],
            )

          ],
        ),

      ),
    );
  }
}
