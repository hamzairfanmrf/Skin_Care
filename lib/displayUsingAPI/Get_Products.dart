import 'package:flutter/material.dart';
import 'package:skin_care/Database/database.dart';
import 'package:skin_care/Model/CART2.dart';
import 'package:skin_care/Model/Cart.dart';
import 'package:skin_care/Model/Check_database.dart';
import 'package:skin_care/Model/Products.dart';
import 'package:skin_care/Products_all/DisplayCart.dart';
import 'package:skin_care/Products_all/products_detail.dart';
import '../API/api.dart';

String aaa;
String nam;
String prodQuantity;
double total=0;
int i=1;


class GetProducts extends StatefulWidget {

  GetProducts(String s,String name){
    print("in constructor the value is $s");
   aaa=s;
   nam=name;
  }


  @override
  _GetProductsState createState() => _GetProductsState();


}

class _GetProductsState extends State<GetProducts> {

  List<Product> p=[];
  APi products=APi.instance;
  int category_Id=int.parse(aaa);
  void getProducts() async {
    var a=await products.Products(context,category_Id);

    setState(() {
      p=products.product;
    });

  }
Future<int> checkProdID(String prodId) async{
    var z=await DBProvider.db.checkProductId(prodId);

    //print(z);
    return z;
  }


  @override
  Widget build(BuildContext context) {
    total=0;
    getProducts();
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F3F4),
        title: Text(
          '$nam',
          style: TextStyle(
            color: Colors.green
          ),
        ),
        centerTitle: true
      ),
      body: SizedBox(
        height: 10000,
        child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,

        ),
            itemCount: p.length,

            itemBuilder: (context, index) {
              return InkWell(
                child: Container(
                  height: 400,

                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),

                    ),


                    child: Row(


                      children: [


                        Expanded(child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.white,
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundColor: Color(0xFFF1F3F4),
                                      backgroundImage: NetworkImage(
                                          products.baseURLProducts +
                                              p[index].image),


                                    ),

                                  ),
                                ),

                              ),


                            ),

                            SizedBox(
                              height: 10,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                '${p[index].name}',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Source Sans Pro',
                                    fontWeight: FontWeight.bold
                                ),

                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              color: Color(0xFF7FAD39),
                              height: 30,
                              child: ElevatedButton(
                                style: TextButton.styleFrom(
                                  primary: Color(0xFF7FAD39),
                                  backgroundColor: Color(0xFF7FAD39),
                                ),
                                child: Text(
                                  'Add to cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Source Sans Pro'
                                  ),
                                ),
                                onPressed: () async {
                                 var z= await checkProdID(p[index].id);
                                // var q= DBProvider.db.checkProductId(p[index].id);
                                 print("quantity of cart is $z");
                                 var qua=z.toString();

                                 var price=p[index].price;








                                  // Cart a=Cart(name: p[index].name,image: p[index].image,quantity: qua,product_id:p[index].id,price: price,c_Id: p[index].c_id,description: p[index].description );
                                  // ++i;

                                  // DBProvider.db.insertProduct(a);
                                  var countOfCart2=await CheckDB.checkDB.checkCount(p[index].id);
                                  print("count of quantity for CART2 is $countOfCart2");
                                  if(countOfCart2 == 1){

                                    Cart2 cart2=Cart2(name: p[index].name,image: p[index].image,quantity: countOfCart2,product_id:p[index].id,price: price,c_Id: p[index].c_id,description: p[index].description );
                                    CheckDB.checkDB.insertProduct(cart2);
                                    CheckDB.checkDB.updateTotal(p[index].id, p[index].price);
                                  }
                                  if(countOfCart2 > 1){
                                   var increaseQuat= await CheckDB.checkDB.increaseQuantity(p[index].id);
                                   CheckDB.checkDB.updateTotal(p[index].id, p[index].price);
                                  }

                                },
                              ),
                            ),
                            Container(height: 10)


                          ],
                        ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(1, 0, 15, 150),
                          child: Icon(

                            Icons.favorite,
                            color: Color(0xFFBABABA),

                          ),
                        ),


                      ],
                    ),


                  ),
                ),
                onTap: (){
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Detail(p[index].name,p[index].image,p[index].description)),
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
