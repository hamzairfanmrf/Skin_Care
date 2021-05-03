import 'package:flutter/material.dart';
import 'package:skin_care/Model/Products.dart';
import 'package:skin_care/Products_all/products_detail.dart';
import '../API/api.dart';

String aaa;
String nam;
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
    print(a);
    setState(() {
      p=products.product;
    });

  }

  @override
  Widget build(BuildContext context) {
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
                                child: Text(
                                  'Add to cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Source Sans Pro'
                                  ),
                                ),
                              ),
                            )


                          ],
                        ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(1, 0, 15, 150),
                          child: Icon(

                            Icons.favorite,
                            color: Colors.lightGreen,

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
