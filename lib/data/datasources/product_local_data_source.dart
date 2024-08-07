import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fruit_shop/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getProducts();
  Future<void> cacheProducts(List<ProductModel> products);
  Future<void> loadInitialData();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  static const _databaseName = "fruit_shop.db";
  static const _tableName = "products";
  static const _initialDataLoadedKey = "initialDataLoaded";

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, name TEXT, price REAL, image TEXT)",
        );
      },
    );
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final db = await database;
    final maps = await db.query(_tableName);
    if (maps.isNotEmpty) {
      return List<ProductModel>.from(maps.map((e) => ProductModel.fromJson(e)));
    } else {
      return [];
    }
  }

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    final db = await database;
    for (var product in products) {
      await db.insert(
        _tableName,
        product.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  @override
  Future<void> loadInitialData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isInitialDataLoaded = prefs.getBool(_initialDataLoadedKey) ?? false;

    if (!isInitialDataLoaded) {
      final jsonString = await rootBundle.loadString('assets/initial_data.json');
      final List<dynamic> jsonResponse = json.decode(jsonString);
      final products = jsonResponse.map((product) => ProductModel.fromJson(product)).toList();
      await cacheProducts(products);

      await prefs.setBool(_initialDataLoadedKey, true);
    }
  }
}
