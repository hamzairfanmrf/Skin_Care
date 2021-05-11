import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:skin_care/displayUsingAPI/Get_Products.dart';
import 'package:sqflite/sqflite.dart';

import 'CART2.dart';

class CheckDB{

  static final CheckDB checkDB=new CheckDB.CheckDB();

  CheckDB.CheckDB();
  static CheckDB get instance => checkDB;

  Database _database;

  Future<Database> get database async{
    _database= await iniDB();
    return _database;

  }

  Future<Database> iniDB() async {

    var theDatabase= await openDatabase(
      join(await getDatabasesPath(),"cartScreen2.db"),
      onCreate: (db,version) async {
        await db.execute("Create Table Cart2(ID INTEGER PRIMARY KEY AUTOINCREMENT ,product_id TEXT,price TEXT,quantity INTEGER,total TEXT,"
            "status TEXT,c_Id TEXT,name TEXT,description TEXT,image TEXT)");

      },
      version: 1,
    );
    return theDatabase;

  }
  Future<void> insertProduct(Cart2 cart) async {
    // Get a reference to the database.
    final Database dbcart = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await dbcart.insert(
      'Cart2',
      cart.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }
  Future<List<Cart2>> carts() async {
    // Get a reference to the database.
    final Database dbcart = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await dbcart.query('Cart2');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Cart2(
        id: maps[i]['id'],
        product_id: maps[i]['product_id'],
        price: maps[i]['price'],
        quantity: maps[i]['quantity'],
        total: maps[i]['total'],
        status: maps[i]['status'],
        c_Id: maps[i]['c_Id'],
        description: maps[i]['description'],
        image: maps[i]['image'],
        name: maps[i]['name'],


      );
    }
    );
  }
  Future<void> decreaseQuantity(String prodid ) async{
    final Database dbcart = await database;
   var z=await dbcart.rawUpdate("UPDATE Cart2 SET quantity=quantity-1 WHERE product_id=$prodid");
    var a=await dbcart.rawQuery("SELECT SUM(quantity) FROM Cart2 where product_id=$prodid" );
    var count=Sqflite.firstIntValue(a);
    if(count<1){
      var del=await dbcart.rawDelete("DELETE FROM CART2 WHERE product_id=$prodid");
    }


  }
  Future<void> increaseQuantity(String prodid ) async{
    final Database dbcart = await database;
    var a=await dbcart.rawUpdate("UPDATE Cart2 "
        "SET quantity=quantity + 1 WHERE"
        " product_id=$prodid ;");


  }
  Future<int> checkCount(String productId) async{
    final Database dbcart = await database;
    var a=  Sqflite.firstIntValue(await dbcart.rawQuery("SELECT COUNT(product_id) from Cart2 where product_id = $productId"));

    a=a+1;
    print("quantity of product is $a");
    //deleteProductID(productId);

    return a;

  }
  Future <void> deleteProductID(String id) async{
    final Database dbcart = await database;
    var a=await dbcart.rawDelete("DELETE FROM Cart2 where product_id=$id");

  }
  Future<void> updateTotal(String id,String price) async{
    final Database dbcart = await database;
    int quan=Sqflite.firstIntValue(await dbcart.rawQuery("SELECT quantity FROM CART2 WHERE product_id =$id"));
    double pr=double.parse(price);
    int pre=pr.toInt();
    int to=quan*pre;
    var total=to.toString();

    print("price in updateTotal is $pr");
    var a=await dbcart.rawUpdate("UPDATE CART2 "
        "SET total=$total WHERE product_id=$id ");
    var z=Sqflite.firstIntValue(await dbcart.rawQuery("SELECT total FROM Cart2 WHERE product_id = $id"));


  }

  Future<int> calTotal() async{
    final Database dbcart = await database;
    var a=Sqflite.firstIntValue(await dbcart.rawQuery("SELECT SUM(CAST(total AS INTEGER)) FROM Cart2"));

    return a;
  }



  
}