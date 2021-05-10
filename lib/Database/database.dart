import 'package:flutter/material.dart';
import 'package:skin_care/Model/Cart.dart';
import 'package:skin_care/displayUsingAPI/Get_Products.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';


class DBProvider {


  static final DBProvider db = new DBProvider.DBProvider();

  DBProvider.DBProvider();

  static DBProvider get instance => db;
  Database _database;

  Future<Database> get database async{
    _database= await iniDB();
    return _database;

  }

 Future<Database> iniDB() async {

    var theDatabase= await openDatabase(
      join(await getDatabasesPath(),"cartScreen.db"),
      onCreate: (db,version) async {
        await db.execute("Create Table Cart(ID INTEGER PRIMARY KEY AUTOINCREMENT ,product_id TEXT,price TEXT,quantity TEXT,total Double,"
            "status TEXT,c_Id TEXT,name TEXT,description TEXT,image TEXT)");

      },
      version: 1,
    );
    return theDatabase;

  }

  Future <Database> dropTable() async{
    var theDatabase= await openDatabase(
      join(await getDatabasesPath(),"cartScreen.db"),
      onCreate: (db,version) async {
        await db.execute("DROP TABLE IF EXISTS Cart");

      },
      version: 1,
    );
    return theDatabase;

  }

  Future<void> insertProduct(Cart cart) async {
    // Get a reference to the database.
    final Database dbcart = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await dbcart.insert(
      'Cart',
      cart.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Cart>> carts() async {
    // Get a reference to the database.
    final Database dbcart = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await dbcart.query('Cart');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Cart(
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

  Future<void> checkAuto() async{
    final Database dbcart = await database;
    var a=await dbcart.rawQuery("SELECT ID from Cart");
    print(a);
  }
Future<int> checkProductId(String productId) async{
    final Database dbcart = await database;
    var a=  Sqflite.firstIntValue(await dbcart.rawQuery("SELECT COUNT(product_id) from Cart where product_id = $productId"));

    a=a+1;
   print("quantity of product is $a");
    //deleteProductID(productId);

   return a;
    
  }



  Future deleteProductID(String id) async{
    final Database dbcart = await database;
    var a=await dbcart.rawDelete("DELETE FROM CART where product_id=$id");

  }
  Future<void> delProWithId() async{
    final Database dbcart = await database;
    var z=await  dbcart.rawQuery("SELECT ID FROM Cart");
    print(z);
  }
  Future<void> deleteAll() async{
    final Database dbcart = await database;
    var z=await dbcart.rawDelete("DELETE FROM CART");
  }

  Future<int> calTotal() async{
    final Database dbcart = await database;
    var a=await dbcart.rawQuery("SELECT SUM(CAST(price AS Integer)) FROM Cart");
    //print(a);

    var total=Sqflite.firstIntValue(a);
    print(total);

    return total;
  }



}

