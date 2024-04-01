// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

String foodModelToJson(List<FoodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodModel {
    String id;
    String title;
    String time;
    List<String> foodTags;
    String category;
    List<String> foodType;
    String code;
    bool isAvailable;
    String restaurant;
    double rating;
    String ratingCount;
    String description;
    int price;
    List<dynamic> additive;
    List<String> imageUrl;
    

    FoodModel({
        required this.id,
        required this.title,
        required this.time,
        required this.foodTags,
        required this.category,
        required this.foodType,
        required this.code,
        required this.isAvailable,
        required this.restaurant,
        required this.rating,
        required this.ratingCount,
        required this.description,
        required this.price,
        required this.additive,
        required this.imageUrl,
       
    });

    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        foodTags: List<String>.from(json["foodTags"].map((x) => x)),
        category: json["category"],
        foodType: List<String>.from(json["foodType"].map((x) => x)),
        code: json["code"],
        isAvailable: json["isAvailable"],
        restaurant: json["restaurant"],
        rating: json["rating"]?.toDouble(),
        ratingCount: json["ratingCount"],
        description: json["description"],
        price: json["price"],
        additive: List<dynamic>.from(json["additive"].map((x) => x)),
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "time": time,
        "foodTags": List<dynamic>.from(foodTags.map((x) => x)),
        "category": category,
        "foodType": List<dynamic>.from(foodType.map((x) => x)),
        "code": code,
        "isAvailable": isAvailable,
        "restaurant": restaurant,
        "rating": rating,
        "ratingCount": ratingCount,
        "description": description,
        "price": price,
        "additive": List<dynamic>.from(additive.map((x) => x)),
        "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
    };
}
