import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_care/API/api.dart';
import 'package:skin_care/Database/database.dart';
import 'package:skin_care/Model/Cart.dart';
import 'package:skin_care/displayUsingAPI/Get_Products.dart';
import 'package:skin_care/sizeConfig/size_config.dart';
 String imageURL;
String img;
double total=0;
var totalOfProduct;

class DisplayCart extends StatefulWidget {

  @override
  _DisplayCartState createState() => _DisplayCartState();
}

class _DisplayCartState extends State<DisplayCart> {
  APi aPi=APi.instance;

  DBProvider cart=DBProvider.instance;

  List<Cart> c=[];


    // deleteItem() async{
    //   DBProvider.db.deleteProduct();
    // }

  //
  Future<void>  getCartItems() async{

     c= await cart.carts();
     print("count of cart is ${c.length}");
   }


  Future<void> dropTable() async{
    var a=await cart.dropTable();

  }


  Future<void> deleteProduct(String id) async{
   var z=await cart.deleteProductID(id);


  }
  Future<void> CheckAuto() async{
    var a=await cart.checkAuto();
  }

 Future<void> deltWithProId() async{
    var z=await cart.delProWithId();
 }
  Future<void> deleteAll() async{
    var a=await cart.deleteAll();
  }

  Future<void> totalProd() async{
   var z=await cart.calTotal();


setState(() {
  totalOfProduct=z;
});
  }


  @override
  Widget build(BuildContext context) {
//deleteItem();
//   GetProducts products;
//  print( products.total);

    //dropTable();
    //deleteAll();

     getCartItems();
    // // // deleteAll();
     totalProd();
    // CheckAuto();



    imageURL=aPi.baseURLProducts;
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
        itemCount: c.length,

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
                           imageURL+c[index].image,
                         ),
                       ),
                       height: 100,
                     ),
                    SizedBox(width: 20),

                    Column(
                      children: [


                        Container(

                          child: Text("${c[index].name}",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Source Sans Pro",

                        ),


                        ),
                          width: getProportionateScreenWidth(110),
                        ),

                        SizedBox(height: 5),
                        Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Text("${c[index].price} AED",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                        ),
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
                                var w=await deleteProduct(c[index].product_id);
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
                        "$totalOfProduct AED",
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
                        "$totalOfProduct AED",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
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
